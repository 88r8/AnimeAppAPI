//
//  MangaService.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 13/09/1445 AH.
//

import Foundation



class MangaService: ObservableObject {
    private let baseURL = "https://api.jikan.moe/v4"
    private let urlSession: URLSession
    
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // Fetch top manga
    func fetchTopManga(completion: @escaping (Result<[Manga], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/top/manga?filter=bypopularity") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Fetch top manuha
    func fetchTopManuha(completion: @escaping (Result<[Manga], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/top/manga?page=&type=manhua") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Fetch top manhwa
    func fetchTopManhwa(completion: @escaping (Result<[Manga], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/top/manga?page=&type=manhwa") else {
            return completion(.failure(NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        }
        
        fetchData(from: url, completion: completion)
    }
    
    // Fetch data
    private func fetchData(from url: URL, completion: @escaping (Result<[Manga], Error>) -> Void) {
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1002, userInfo: [NSLocalizedDescriptionKey: "No data"])))
            }
            
            do {
                let mangaResponse = try JSONDecoder().decode(GetTopManga.self, from: data)
                completion(.success(mangaResponse.data))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
