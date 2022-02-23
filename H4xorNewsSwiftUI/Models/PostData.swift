//
//  PostData.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // при подписи на Identifiable должен присутствовать id
    var id: String {
        objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
