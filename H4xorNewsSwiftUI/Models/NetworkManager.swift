//
//  NetworkManager.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import Foundation

final class NetworkManager: ObservableObject {
    // после получения и декодирования данных каждый кто подписан на ObservableObject
    // получает уведомление
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                  let decoder = JSONDecoder()
                    guard let data = data else {
                        return
                    }
                    do {
                        let results = try decoder.decode(Results.self, from: data)
                        // @Published свойства обнвляются ТОЛЬКО в главном потоке
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
