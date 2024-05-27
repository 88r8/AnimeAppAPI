//
//  MangaView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 14/09/1445 AH.
//


import SwiftUI

struct MangaView: View {
    
    @StateObject private var viewModel = ApiViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    
                    VStack {
                        if !searchTerm.isEmpty {
                            withAnimation {
                                MangaSearchView(searchMangaTerm: $searchTerm)
                            }
                            
                        } else {
                            if viewModel.isLoading == true {
                                ProgressView()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                                
                                
                            } else {
                                MangaPopularSection(viewModel: viewModel)
                                ManhuaSection(viewModel: viewModel)
                                ManhwaSection(viewModel: viewModel)
                                
                            }
                            
                        }
                    }
                    .navigationTitle("Manga")
                    .searchable(text: $searchTerm, prompt: "Search")
                    
                    
                }
            }
        }
        .onAppear { fecthData() }
    }

    func fecthData() {
     
        viewModel.fetchManga()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                viewModel.isLoading = false
            }
        }
    }
}

#Preview {
    AnimeView()
}

// Mark -- MangaPopularSection View
struct MangaPopularSection : View {
    @ObservedObject var viewModel: ApiViewModel
    
    var body: some View {
        Section(header: HeaderView(title: "Popular")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.topManga) { manga in
                        NavigationLink {
                            MangaDetailView(manga: manga)
                        } label: {
                            CardView(image: manga.images.jpg.largeImageUrl, title: manga.title, status: manga.status, score: manga.score)
                                .foregroundColor(Color(uiColor: .label))
                            
                        }
                        
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
    }
}

// Mark -- ManhuaSection View
struct ManhuaSection : View {
    @ObservedObject var viewModel: ApiViewModel
    @Namespace private var animation
    var body: some View {
        Section(header: HeaderView(title: "manhua")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.topManhua) { manga in
                        NavigationLink {
                            MangaDetailView(manga: manga)
                        } label: {
                            CardView(image: manga.images.jpg.largeImageUrl, title: manga.title, status: manga.status, score: manga.score)
                                .foregroundColor(Color(uiColor: .label))
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
    }
}

// Mark -- ManhwaSection View
struct ManhwaSection: View  {
    @ObservedObject var viewModel: ApiViewModel
    @Namespace private var animation
    var body: some View {
        Section(header: HeaderView(title: "Manhwa")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.topManhwa) { manga in
                        
                        NavigationLink {
                            MangaDetailView(manga: manga)
                        } label: {
                            CardView(image: manga.images.jpg.largeImageUrl, title: manga.title, status: manga.status, score: manga.score)
                                .foregroundColor(Color(uiColor: .label))
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
    }
}


