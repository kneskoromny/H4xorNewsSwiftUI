//
//  WebView.swift
//  H4xorNewsSwiftUI
//
//  Created by Кирилл Нескоромный on 23.02.2022.
//

import Foundation
import WebKit
import SwiftUI

// протокол позволяет применять view из UIKit внутри SWiftUI
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    // указываем view, которую хотим создать
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let str = urlString {
            if let url = URL(string: str) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
