//
//  AnimeView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 14/09/1445 AH.
//

import SwiftUI

struct AnimeView: View {
    
    @EnvironmentObject private var viewModel: ApiViewModel
    @State private var searchTerm = ""
    
    @Namespace private var animation
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        if !searchTerm.isEmpty {
                            withAnimation {
                                AnimeSearchView(searchAnimeTerm: $searchTerm)
                            }
                            
                        } else {
                            if viewModel.isLoading == true  {
                                ProgressView()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                            } else {
                                PopularSection(viewModel: viewModel)
                                CurrentlyAiringSection(viewModel: viewModel)
                                UpcomingSection(viewModel: viewModel)
                            }
                            
                        }
                    }
                    .navigationTitle("Anime")
                    .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search")
                    
                }
            }
            .onAppear { fecthData() }
        }
    }
    
    
    
    func fecthData() {
        viewModel.fetchAnime()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                viewModel.isLoading = false
            } 
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView()
    }
}



// Mark -- PopularSection View
struct PopularSection: View {
    @ObservedObject var viewModel: ApiViewModel
    @Namespace private var animation
    var body: some View {
        Section(header: HeaderView(title: "Popular")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.topAnime) { anime in
                        NavigationLink {
                            AnimeDetailView(anime: anime, viewModel: viewModel)
                            
                        } label: {
                            CardView(image: anime.images.jpg.largeImageUrl, title: anime.title, status: anime.status ?? "", score: anime.score ?? 0.0)
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

// Mark -- CurrentlyAiringSection View
struct CurrentlyAiringSection: View {
    @ObservedObject var viewModel: ApiViewModel
    @Namespace private var animation
    
    var body: some View {
        Section(header: HeaderView(title: "Currently Airing")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.animeAiring) { anime in
                        NavigationLink {
                            AnimeDetailView(anime: anime, viewModel: viewModel)
                        } label: {
                            CardView(image: anime.images.jpg.largeImageUrl, title: anime.title, status: anime.status ?? "", score: 0.0)
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

// Mark -- UpcomingSection View
struct UpcomingSection: View {
    @ObservedObject var viewModel: ApiViewModel
    
    @Namespace private var animation
    
    var body: some View {
        Section(header: HeaderView(title: "Upcoming")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(viewModel.upcoming) { anime in
                        NavigationLink {
                            AnimeDetailView(anime: anime, viewModel: viewModel)
                        } label: {
                            CardView(image: anime.images.jpg.largeImageUrl, title: anime.title, status: anime.status ?? "", score: 0.0)
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

