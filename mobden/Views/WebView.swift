//
//  WebView.swift
//  mobden
//
//  Created by administrator on 3/17/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI
import  WebKit

struct WebView: View {
    var url:String 
    
    init(url:String){
        if !url.contains("http"){
            self.url = "https://" + url
        }
        else{ self.url = url}
        print(self.url)
    }
    
    var body: some View {
        ZStack{
            WebPage(url:self.url)
        }
    }
}


struct WebPage : UIViewRepresentable {
    var url :String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let urlRequest = URLRequest(url: url)
        let web = WKWebView()
        web.load(urlRequest)
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebPage>) {
        
    }
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "")
    }
}
