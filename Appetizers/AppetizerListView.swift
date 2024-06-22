//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Salvador on 6/21/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                Text(appetizer.name)
            }
            .navigationTitle("🍟 Appetizers")
        }
        
    }
}

#Preview {
    AppetizerListView()
}
