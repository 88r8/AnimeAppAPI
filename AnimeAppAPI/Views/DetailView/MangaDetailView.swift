//
//  DitialView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 15/09/1445 AH.
//

import SwiftUI
import WebKit

struct MangaDetailView: View {
    let manga : Manga
    @State private var isExpanded: Bool = false
    var body: some View {
       
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    AsyncImage(url: manga.images.jpg.largeImageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .shadow(radius: 8)
                            .frame(height: 200)
                            .padding(.bottom)
                            .padding(.trailing,4)
                            .padding(.leading)
                        
                    }  placeholder: {
                        ProgressView()
                        
                            .frame(width: 140,height: 200)
                            .background(Color(uiColor: .tertiarySystemBackground))
                            .cornerRadius(8)
                            .shadow(radius: 3)
                            .padding(.bottom,4)
                            .padding(.trailing,4)
                            .padding(.leading)
                        
                    }
                    
                    VStack(alignment: .leading,spacing: 3) {
                        Text(manga.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text(String(format: "%.2f", manga.score))
                            .bold()
                            .font(.system(size: 12))
                            .frame(width: 45, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.orange)
                            .cornerRadius(5)
                        
                        
                        HStack(spacing:2) {
                            Text("Rank: #")
                                .fontWeight(.semibold)
                            
                                .frame(alignment: .leading)
                            
                            Text("\(manga.rank)")
                                .bold()
                                .foregroundStyle(Color.blue)
                            
                                .frame(alignment: .leading)
                        }
                        
                        Text("\(manga.chapters ?? 0)")
                            .font(.caption)
                            .frame(alignment: .leading)
                        
                        Text(manga.status)
                            .font(.caption)
                            .frame(alignment: .leading)
                        
                        Text(manga.genres.map { $0.name }.joined(separator: ", "))
                            .font(.caption2)
                            .padding(.bottom, 4)
                            .frame(alignment: .leading)
                    }
                    
                }
                
                Divider()
                
                    .frame(height: 3)
                    .background(Color(uiColor: .orange))
                
                Text(manga.synopsis)
                    .lineLimit(isExpanded ? nil : 5)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.caption2).bold()
                    .padding()
                    .overlay(
                        GeometryReader { proxy in
                            Button(action: {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                                
                            }) {
                                Text(isExpanded ? "Show Less" : "Read More")
                                    .font(.caption).bold()
                                    .padding(.leading, 8.0)
                                
                                    .foregroundColor(.orange)
                            }
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                        })
                    .padding(.top,4)
                    .padding(.trailing)
                
                
                Divider()
                    .frame(height: 3)
                    .background(Color(uiColor: .orange))
                    .padding(.bottom)
            }
        }
        
        Spacer()
    }
}

#Preview {
    MangaDetailView(manga: Manga.sample)
}

