//
//  LoadingView.swift
//  Appetizers
//
//  Created by Salvador on 6/22/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        return activityIndicatorView
    }

            func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
            
}

struct LoadingView: View {
    var body: some View {
//        ZStack {
//            Color(.systemBackground)
//                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
//        }
    }
}

#Preview {
    LoadingView()
}
