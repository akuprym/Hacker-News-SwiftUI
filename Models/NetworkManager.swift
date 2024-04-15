//
//  NetworkManager.swift
//  Hacker News
//
//  Created by admin on 27.09.22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
//    property that other objects are listening to.
    
    func fetchData() {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            
// As we use @Published, we must fetch the MAIN thread.
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
    
    
    
    
    
}
