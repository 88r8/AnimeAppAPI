//
//  CardView.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 08/09/1445 AH.
//

import SwiftUI

struct CardView: View {
    var image : URL
    var title : String
    var status : String
    var score : Double
    
    var body: some View {
        VStack(spacing: 5) {
            AsyncImage(url: image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 170)
                    .cornerRadius(5)
          
            } placeholder: {
                ProgressView()
                
                    .frame(width: 120, height: 170)
                    .background(Color(uiColor: .tertiarySystemBackground))
                    .cornerRadius(5)
                   
            }
          
            VStack(alignment: .leading,spacing: 3){

                Text(title)
                    .frame(width: 110,alignment: .leading)
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                
                Text(status)
                    .font(.system(size: 9))
                    .font(.caption2)
                    .frame(width: 110,alignment: .leading)
                
                   
                HStack(spacing: 3 ) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.caption2)
                    
                    Text(String(format: "%.2f", score))
                    .font(.caption2)               }
            }
            
            .padding(.horizontal)
            
            Spacer()
            
        }
        .frame(width: 120, height: 230)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}


#Preview {
    CardView(image: URL(string: "https://cdn.myanimelist.net/images/anime/1244/138851l.jpg")!, title: "One Pace", status: "Finished",score: 8.7)
}
