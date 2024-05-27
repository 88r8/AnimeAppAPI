//
//  YTVIew.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 16/09/1445 AH.
//

import SwiftUI
import WebKit

struct YTVIew: View {
    let vID : String
    
    var body: some View {
        Video(videoID: vID)
            .frame(width: 350, height: 190, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}

#Preview {
    YTVIew(vID: "--IcmZkvL0Q")
}


struct Video: UIViewRepresentable {
    let videoID : String
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let trailerURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: trailerURL))
        
    }
    
    func makeUIView(context : Context) -> some WKWebView {
        return WKWebView()
    }
    
}
