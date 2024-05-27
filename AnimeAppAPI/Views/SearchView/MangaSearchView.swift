//
//  SearchView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 14/09/1445 AH.
//



import SwiftUI

struct MangaSearchView: View {
    
    let columns : [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @StateObject private var viewModel = ApiViewModel()
    @Binding var searchMangaTerm: String
    
    var allManga: [Manga] {
            viewModel.topManga + viewModel.topManhwa + viewModel.topManhua
        }
        
        var filteredManga: [Manga] {
            guard !searchMangaTerm.isEmpty else { return allManga }
            return allManga.filter { $0.title.localizedStandardContains(searchMangaTerm) }
        }

    var body: some View {
  
        ScrollView {
            LazyVGrid(columns: columns,spacing: 10) {
                ForEach(filteredManga,id: \.id)  {searching in
                    NavigationLink {
                        MangaDetailView(manga: searching)
                    } label: {
                        CardView(image: searching.images.jpg.largeImageUrl, title: searching.title, status: searching.status, score: searching.score)
                            .foregroundColor(Color(uiColor: .label))
                    }
                }
            }
        }
        
        .onAppear { viewModel.fetchManga() }
        
    }
    
    
}
