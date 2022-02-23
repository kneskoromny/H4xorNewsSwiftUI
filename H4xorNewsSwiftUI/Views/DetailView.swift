//
//  DetailView.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


