//
//  AnimeSearchView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 22/09/1445 AH.
//


import SwiftUI

struct AnimeSearchView: View {
    
    let columns : [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @StateObject private var viewModel = ApiViewModel()
    @Binding var searchAnimeTerm: String
    
    var allAnime: [Anime] {
        viewModel.topAnime + viewModel.animeAiring + viewModel.upcoming
        }
        
        var filteredAnime: [Anime] {
            guard !searchAnimeTerm.isEmpty else { return allAnime }
            return allAnime.filter { $0.title.localizedStandardContains(searchAnimeTerm) }
        }
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: columns,spacing: 10) {
                    ForEach(filteredAnime,id: \.id)  {searching in
                        NavigationLink {
                            AnimeDetailView(anime: searching, viewModel: viewModel)
                        } label: {
                            
                            CardView(image: searching.images.jpg.largeImageUrl, title: searching.title, status: searching.status ?? "", score: searching.score ?? 0.0)
                                .foregroundColor(Color(uiColor: .label))
                               
                            
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
        
        .onAppear { viewModel.fetchAnime() }
        
    }
}

