//
//  DetailView.swift
//  Hacker News
//
//  Created by admin on 28.09.22.
//

import SwiftUI
import WebKit


struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
            .ignoresSafeArea()
    }
        
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}

struct WebView: UIViewRepresentable {
//    allows to create a SwiftUI view that represents a UIKit view
    
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
