//
//  SongRow.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//  Row displaying one song in overall final view for app
//

import SwiftUI

struct SongRow: View {
    //the song being displayed within this row
    var result: DeezerSong
    
    var body: some View {
            HStack {
                //load album image
                AsyncImage(url: URL(string: result.album.cover ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
               
                Spacer()
                
                //song title and artist name
                HStack {
                   VStack(spacing: 8) {
                    Text(result.title)
                        .font(.headline)
                        .foregroundColor(.black)
                                
                    Text(result.artist.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }
                Spacer()
            }
            .padding(8)
            .background(Color.purple.opacity(0.2))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)) 
            .shadow(radius: 5)
    }
}


#Preview {
    SongRow(result: Seasons)
}
