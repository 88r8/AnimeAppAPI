//
//  ManageHeader.swift
//  AnimeAppAPI
//
//  Created by salman faleh on 09/09/1445 AH.
//

import SwiftUI

struct HeaderView: View {
    var title : String
    var body: some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            Button("See All") {
                // No Action?? ):
            }
            .foregroundColor(Color.orange)
        }
        .padding(.horizontal)
       
    }
}

#Preview {
    HeaderView(title: "Top")
}
