//
//  AccountView.swift
//  Appetizers
//
//  Created by Salvador on 6/21/24.
//

import SwiftUI

struct AccountView: View {
    
    @State var viewModel = AccountViewModel()
           
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField(
                        "First Name",
                        text: $viewModel.user.firstName
                    )
                    TextField(
                        "Last Name",
                        text: $viewModel.user.lastName
                    )
                    TextField(
                        "Email",
                        text: $viewModel.user.email
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthdate,
                        displayedComponents: .date
                    )
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Saved Changes")
                    }
                    
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle("💻 Account")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
                
            )
        }
    }
}

#Preview {
    AccountView()
}
