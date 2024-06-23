//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Salvador on 6/21/24.
//

import UIKit

// NetworkManager is a singleton class responsible for handling network requests.
final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    // The base URL for the backend API.
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // The full URL for the appetizers endpoint.
    private let appetizerURL = baseURL + "appetizers"
    
    // Private initializer to prevent the creation of multiple instances.
    private init() {}
    
    // Function to fetch appetizers from the backend API.
    // The completion handler returns a Result with an array of Appetizer objects on success, or an APError on failure.
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        // Ensure the URL is valid; otherwise, return an invalid URL error.
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        // Create a data task to fetch data from the URL.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // Check for errors in the network request; if an error exists, return an unable to complete error.
            guard error == nil else {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Ensure the response is an HTTPURLResponse and that the status code is 200 (OK).
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // Ensure the data is not nil; otherwise, return an invalid data error.
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // Attempt to decode the data into an AppetizerResponse object.
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                // If decoding succeeds, return the decoded array of appetizers.
                completed(.success(decodedResponse.request))
            } catch {
                // If decoding fails, return an invalid data error.
                completed(.failure(.invalidData))
            }
        }
        
        // Start the data task.
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
        
    }
}
