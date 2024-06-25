//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Salvador on 6/24/24.
//

import SwiftUI
import Observation

@Observable 
class AccountViewModel {
    
    // AppStorage not supported with Observable
    @ObservationIgnored @AppStorage("user") private var userData: Data?
    var user = User()
    var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUesrData
        }
    }
    
    func retrieveUser() {
        
    }
    
    // Computed property
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
