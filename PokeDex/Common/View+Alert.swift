//
//  View+Alert.swift
//  PokeDex
//
//  Created by Angie Mugo on 31/10/2023.
//

import SwiftUI

extension View {
    func appAlert(_ appAlert: Binding<AppAlert?>) -> some View {
        let alertType = appAlert.wrappedValue

        if case .message = alertType {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                appAlert.wrappedValue = nil
            }
        }

        let alert =  alert(Text(alertType?.title ?? ""), isPresented: .constant(alertType != nil)) {
            Button("OK") {
                appAlert.wrappedValue = nil
            }
        } message: {
            Text(alertType?.message ?? "")
        }
        return alert
    }
}
