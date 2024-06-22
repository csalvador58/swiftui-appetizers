//
//  Appetizer.swift
//  Appetizers
//
//  Created by Salvador on 6/21/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    static func createSampleAppetizers() -> [Appetizer] {
        return [
            Appetizer(id: 0001,
                      name: "Test Appetizer",
                      description: "This is the description for my appetizer. It's yummy",
                      price: 9.99,
                      imageURL: "",
                      calories: 99,
                      protein: 99,
                      carbs: 99),
            Appetizer(id: 0002,
                      name: "Savory Starters",
                      description: "Delicious appetizer to kick off your meal.",
                      price: 12.49,
                      imageURL: "",
                      calories: 120,
                      protein: 8,
                      carbs: 15),
            Appetizer(id: 0003,
                      name: "Zesty Zucchini Bites",
                      description: "Crispy zucchini bites with a tangy dip.",
                      price: 11.99,
                      imageURL: "",
                      calories: 150,
                      protein: 6,
                      carbs: 20),
            
            Appetizer(id: 0004,
                      name: "Cheese Platter",
                      description: "Assorted cheese platter with crackers and fruit.",
                      price: 14.99,
                      imageURL: "",
                      calories: 180,
                      protein: 10,
                      carbs: 12)
        ]
    }
    
    
    static let appetizers = createSampleAppetizers()
}

