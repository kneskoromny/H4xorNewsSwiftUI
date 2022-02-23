//
//  ContentView.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import SwiftUI

struct ContentView: View {
    // при обновлении NetworkManager это свойство получает уведомление
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            
            List(networkManager.posts, rowContent: { post in
                // управляет переходом по нажатию на ячейку
                NavigationLink(destination: DetailView(url: post.url)) {
                    
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
                .navigationTitle("H4xor News")
                .listStyle(.inset)
        }
        // заменяет viewDidLoad, когда загружается view вызывается этот метод
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


