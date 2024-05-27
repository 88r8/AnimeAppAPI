//
//  TabView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 14/09/1445 AH.
//

import SwiftUI

struct TabarView: View {
    @StateObject var viewModel = ApiViewModel()
    var body: some View {
        TabView {
            AnimeView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "tv")
                    Text("Anime") }
            
                MangaView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "book")
                    Text("Manga")    }
            
        }
        .accentColor(.orange)
    }
    
}

#Preview {
    TabarView()
}
