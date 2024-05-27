//
//  ApiViewModel.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 17/09/1445 AH.
//


import Foundation

class ApiViewModel: ObservableObject {
    
    private let mangaService = MangaService()
    private let animeService = AnimeService()
    
    // Published properties
    @Published var topManga     : [Manga]     = []
    @Published var topManhwa    : [Manga]     = []
    @Published var topManhua    : [Manga]     = []
    @Published var topAnime     : [Anime]     = []
    @Published var animeAiring  : [Anime]     = []
    @Published var upcoming     : [Anime]     = []
    @Published var isLoading    = true
    
    
    // Fetch anime data
    func fetchAnime() {
        fetchTopAnime()
        fetchUpcomingAnime()
        fetchAiringAnime()
    }
    
    private func fetchTopAnime() {
        animeService.fetchTopAnime { result in
            self.handleAnimeResult(result, for: \.topAnime)
        }
    }
    
    private func fetchUpcomingAnime() {
        animeService.fetchUpcomingAnime { result in
            self.handleAnimeResult(result, for: \.upcoming)
        }
    }
    
    private func fetchAiringAnime() {
        animeService.fetchAiringAnime { result in
            self.handleAnimeResult(result, for: \.animeAiring)
        }
    }
    
    private func handleAnimeResult(_ result: Result<[Anime], Error>, for keyPath: ReferenceWritableKeyPath<ApiViewModel, [Anime]>) {
        switch result {
        case .success(let anime):
            DispatchQueue.main.async {
                self[keyPath: keyPath] = anime
            }
        case .failure(let error):
            print("Error fetching anime: \(error)")
        }
    }
    
    // Fetch manga data
    func fetchManga() {
        fetchTopManga()
        fetchTopManhwa()
        fetchTopMangaPopularity()
    }
    
    private func fetchTopManga() {
        mangaService.fetchTopManga { result in
            self.handleMangaResult(result, for: \.topManga)
        }
    }
    
    private func fetchTopManhwa() {
        mangaService.fetchTopManhwa { result in
            self.handleMangaResult(result, for: \.topManhwa)
        }
    }
    
    private func fetchTopMangaPopularity() {
        mangaService.fetchTopManuha { result in
            self.handleMangaResult(result, for: \.topManhua)
        }
    }
    
    private func handleMangaResult(_ result: Result<[Manga], Error>, for keyPath: ReferenceWritableKeyPath<ApiViewModel, [Manga]>) {
        switch result {
        case .success(let manga):
            DispatchQueue.main.async {
                self[keyPath: keyPath] = manga
            }
        case .failure(let error):
            print("Error fetching manga: \(error)")
        }
    }
 
  
}




