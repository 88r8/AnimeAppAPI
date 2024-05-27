//
//  Model.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 08/09/1445 AH.


import Foundation

struct GetTopManga: Codable {
    let data: [Manga]
}


struct GetTopAnime: Codable {
    let data: [Anime]
}


// MARK: - Anime
struct Anime: Codable, Identifiable {
    let id: Int?
    let title: String
    let synopsis: String?
    let images: Images
    let type: String?
    let score : Double?
    let status : String?
    let rank : Int?
    let genres: [Genres]
    let episodes : Int?
    let trailer: Trailer?
    let airing : Bool?
    let aired: Aired?
    let season : String?
    let year : Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case title
        case synopsis
        case images
        case type
        case score
        case status
        case rank
        case genres
        case episodes
        case trailer
        case airing
        case aired
        case season
        case year
    }
}

// MARK: - Manga
struct Manga: Codable, Identifiable {
    let id: Int
    let title: String
    let synopsis: String
    let images: Images
    let type: String
    let score : Double
    let status : String
    let rank : Int
    let genres: [Genres]
    let chapters: Int?
    


    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case title
        case synopsis
        case images
        case type
        case score
        case status
        case rank
        case genres
        case chapters
     
    }
}

// MARK: - Genres
struct Genres: Codable {
    let id: Int
    let name: String
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case name
        case url
    }
}

// MARK: - Images
struct Images: Codable {
    let jpg: ImageURL
    let webp: ImageURL
}
struct ImageURL: Codable {
    let imageUrl: URL
    let smallImageUrl: URL
    let largeImageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case smallImageUrl = "small_image_url"
        case largeImageUrl = "large_image_url"
       
    }
}

// MARK: - Aired
struct Aired: Codable {
    let from, to: String?
    let prop: Prop?
}

// MARK: - Prop
struct Prop: Codable {
    let from, to: From?
    let string: String?
}

// MARK: - From
struct From: Codable {
    let day, month, year: Int?
}

// MARK: - Trailer
struct Trailer: Codable {
    let youtubeID, url, embedURL: String?

    enum CodingKeys: String, CodingKey {
        case youtubeID = "youtube_id"
        case url
        case embedURL = "embed_url"
    }
}

// MARK: - Broadcast
struct Broadcast: Codable {
    let day, time, timezone, string: String?
}

// MARK: - Pagination
struct Pagination: Codable {
    let lastVisiblePage: Int?
    let hasNextPage: Bool?

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
    }
}


// MARK: - Samples
extension Anime {
    static var sample =  Anime(id: 0, title: "Naruto", synopsis: "sss", images: Images(jpg: ImageURL(imageUrl:URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")! , smallImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, largeImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!), webp: ImageURL(imageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, smallImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, largeImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!)), type: "nil", score: 8.7, status: "fff", rank: 0 , genres: [], episodes: 0 , trailer: Trailer(youtubeID:  "--IcmZkvL0Q", url: "", embedURL: ""), airing: false,aired: nil,season : "",year: 2002)
}

extension Manga {
    static var sample = Manga(id: 0, title: "Vagabond", synopsis: "sss", images: Images(jpg: ImageURL(imageUrl:URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")! , smallImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, largeImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!), webp: ImageURL(imageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, smallImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!, largeImageUrl: URL(string: "https://cdn.myanimelist.net/images/manga/2/253146l.jpg")!)), type: "", score: 8.7, status: "fff", rank: 3, genres: [], chapters: 327)
}
