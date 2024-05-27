//
//  AnimeDitialView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 16/09/1445 AH.
//

import SwiftUI
import WebKit

struct AnimeDetailView: View {

    let anime : Anime
    @State private var isExpanded: Bool = false
    @ObservedObject var viewModel: ApiViewModel
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    
                    HStack {
                        AsyncImage(url: anime.images.jpg.largeImageUrl) { image in
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
                            Text(anime.title)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            //  .matchedGeometryEffect(id: "title\(anime.title)", in: namespace)
                            HStack(spacing: 3) {
                                Image(systemName: "star.fill")
                                    .font(.caption2)
                                
                                Text(String(format: "%.2f", anime.score ?? 0.0))
                                    .bold()
                                    .font(.system(size: 12))
                            }
                            .frame(width: 55, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.orange)
                            .cornerRadius(5)
                            
                            HStack(spacing:2) {
                                Text("Rank: #")
                                    .fontWeight(.semibold)
                                    .frame(alignment: .leading)
                                
                                Text("\(anime.rank ?? 0)")
                                    .bold()
                                    .foregroundStyle(Color.blue)
                                //.padding(.bottom,4)
                                    .frame(alignment: .leading)
                            }
                            
                            
                            Text("Episodes\(anime.episodes ?? 0)")
                                .font(.caption)
                            // .padding(.bottom,4)
                                .frame(alignment: .leading)
                            
                            Text(anime.status ?? "")
                                .font(.caption)
                            // .padding(.bottom,4)
                                .frame(alignment: .leading)
                            
                            Text(anime.genres.map { $0.name }.joined(separator: ", "))
                                .font(.caption2)
                                .padding(.bottom, 4)
                                .frame(alignment: .leading)
                        }
                        
                    }
                    
                    Divider()
                        .frame(height: 3)
                        .background(Color(uiColor: .orange))
                    
                    Text(anime.synopsis ?? "")
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
                    //.bold()
                        .frame(height: 3)
                        .background(Color(uiColor: .orange))
                        .padding(.bottom)
                    
                    YTVIew(vID: anime.trailer?.youtubeID ?? "")
                        .padding()
                    
                    
                    Spacer()
                }
                .frame(minHeight: geometry.size.height)
            }
            
        }
        
    }
        
      
    }

//
//#Preview {
//    AnimeDetailView(anime: Anime.sample, viewModel: ApiViewModel())
//}
//



