//
//  ContentView.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List(posts, rowContent: { post in
                Text(post.title)
            })
            .navigationTitle("H4xor News")
            .listStyle(.inset)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello!"),
    Post(id: "2", title: "Bonjour!"),
    Post(id: "3", title: "Hola!")
]
