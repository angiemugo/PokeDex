//
//  NetworkNetwork.swift
//  PokeDex
//
//  Created by Angie Mugo on 30/10/2023.
//

import Foundation

public enum PokeDexClientError: Error {
    case genericError(Error)
    case apiError(code: PokeDexErrorCode, type: String, message: String)
    case bodyEncodingError(Error)
    case decodingError(Error)
    case unsupportedResponseError
    case builderError(message: String)
}

public enum PokeDexErrorCode: String {
    case invalidJson = "invalid_json"
    case invalidRequestURL = "invalid_request_url"
    case invalidRequest = "invalid_request"
    case validationError = "validation_error"
    case unauthorized = "unauthorized"
    case invalidToken = "invalid_auth_token"
    case genericError
}

public enum Network {
    public typealias HTTPHeaders = [String: String]
    public static let pokeBaseURl = URL(string: "https://pokeapi.co/")

    public enum HTTPMethod: String {
        case GET
    }

    public enum PokeDexErrors: Error {
        case HTTPError(code: Int)
        case genericError(Error)
    }
}

public protocol NetworkClient: AnyObject {
    func get<R: Decodable>(_ url: URL, completed: @escaping (Result<R, PokeDexClientError>) -> Void)
}

public struct ErrorResponse {
    public let error: ErrorDetail
}

extension ErrorResponse: Decodable {}

public struct ErrorDetail {
    public let type: String
    public let message: String
}

extension ErrorDetail: Decodable {}

public enum NetworkClientHelpers {
    public static func extractError(data: Data?, response: URLResponse?, error: Error?) -> PokeDexClientError? {
        if let error = error {
            return .genericError(error)
        }

        return extractError(data: data, response: response)
    }

    public static func extractError(data: Data?, response: URLResponse?) -> PokeDexClientError? {
        guard let response = response as? HTTPURLResponse else {
            return .unsupportedResponseError
        }

        if (400..<503).contains(response.statusCode) {
            if let data = data {
                if let err = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    return .apiError(code: PokeDexErrorCode(rawValue: err.error.type) ?? .genericError, type: err.error.type, message: err.error.message)
                } else {
                    return .genericError(Network.PokeDexErrors.HTTPError(code: response.statusCode))
                }
            } else {
                return .genericError(Network.PokeDexErrors.HTTPError(code: response.statusCode))
            }
        }

        return nil
    }

    public static func extractError(response: URLResponse?, error: Error?) -> PokeDexClientError? {
        if let error = error {
            return .genericError(error)
        }

        guard let response = response as? HTTPURLResponse else {
            return .unsupportedResponseError
        }

        if (400..<503).contains(response.statusCode) {
            return .genericError(Network.PokeDexErrors.HTTPError(code: response.statusCode))
        }

        return nil
    }
}


public class DefaultNetworkClient: NetworkClient {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public func get<R>(_ url: URL, completed: @escaping (Result<R, PokeDexClientError>) -> Void) where R : Decodable {
        let request = buildRequest(method: .GET, url: url)
        executeRequest(request: request, completed: completed)
    }

    private func initRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        return request
    }

    private func buildRequest(method: Network.HTTPMethod, url: URL) -> URLRequest {
        var request = initRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }

    private func executeRequest<T: Decodable>(request: URLRequest, completed: @escaping (Result<T, PokeDexClientError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            var completeResult: Result<T, PokeDexClientError>?

            if let error = NetworkClientHelpers.extractError(data: data, response: response, error: error) {
                completeResult = .failure(error)
            } else if let data = data {
                do {
                    let result = try self.decoder.decode(T.self, from: data)
                    completeResult = .success(result)
                } catch let decodingError as Swift.DecodingError {
                    completeResult = .failure(.decodingError(decodingError))
                } catch {
                    completeResult = .failure(.genericError(error))
                }
            } else {
                completeResult = .failure(.unsupportedResponseError)
            }

            DispatchQueue.main.async {
                guard let completeResult = completeResult else {
                    fatalError("Something is wrong, no result!")
                }
                completed(completeResult)
            }
        }
        task.resume()
    }
}
