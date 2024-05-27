//
//  AnimeService.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 14/09/1445 AH.
//
import Foundation



class AnimeService {
    private let baseURL = "https://api.jikan.moe/v4"
    private let urlSession: URLSession
    
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // Fetch top anime 
    func fetchTopAnime(completion: @escaping (Result<[Anime], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/top/anime?filter=bypopularity") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Fetch upcoming anime
    func fetchUpcomingAnime(completion: @escaping (Result<[Anime], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/top/anime?filter=upcoming") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Fetch currently airing anime
    func fetchAiringAnime(completion: @escaping (Result<[Anime], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/seasons/now") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Generic method to fetch data from a given URL
    private func fetchData(from url: URL, completion: @escaping (Result<[Anime], Error>) -> Void) {
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1002, userInfo: [NSLocalizedDescriptionKey: "No data"])))
            }
            
            do {
                let animeResponse = try JSONDecoder().decode(GetTopAnime.self, from: data)
                completion(.success(animeResponse.data))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
