//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Salvador on 6/21/24.
//

import SwiftUI

@Observable class AppetizerListViewModel {
    
    // An array to hold the fetched appetizers, initially empty
    var appetizers: [Appetizer] = []
    
    // Optional variable to hold an alert item
    var alertItem: AlertItem?
    
    var isLoading = false
    
    
    
    // Function to fetch appetizers from the network
    func getAppetizers() {
        
        isLoading = true
        
        // Call the NetworkManager's getAppetizers function
        NetworkManager.shared.getAppetizers { [self] result in
            // Ensure UI updates are performed on the main thread
            DispatchQueue.main.async { [self] in
                
                isLoading = false
                
                // Handle the result of the network request
                switch result {
                case .success(let appetizers):
                    // If successful, update the appetizers array with fetched data
                    self.appetizers = appetizers
                case .failure(let error):
                    // Handle different error cases and set the appropriate alert item
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
