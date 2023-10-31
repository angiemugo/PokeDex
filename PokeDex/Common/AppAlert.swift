//
//  AppAlert.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import Foundation

import SwiftUI

enum AppAlert {
    case message(title: String, message: String)
    case errors(errors: [Error])

    var title: String {
        switch self {
        case .message(let title, _): return title
        case .errors(_): return "GraphQL Error(s)"
        }
    }

    var message: String {
        switch self {
        case .message(_, let message): return message
        case .errors(let errors):
            let message = errors.map { $0.localizedDescription }.joined(separator: "\n")
            return message
        }
    }
}
