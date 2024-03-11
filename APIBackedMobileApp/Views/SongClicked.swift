//
//  SongClicked.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//
import SwiftUI
import AVKit

struct SongClicked: View {
    //song clicked on from SongView
    var song: DeezerSong
    @State private var isPlaying = false
    
    var body: some View {
        VStack(spacing: 4) {
            
            //load image from Deezer
            AsyncImage(url: URL(string: song.album.cover ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            Spacer()
                .frame(height:4)
    
            Text("\(song.title)")
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(song.artist.name)")
                .font(.footnote)
                .foregroundStyle(.white)
            
            Text("Album: \(song.album.title)")
                .padding()
            
            //if song has a preview url in query, load it
            if let previewURL = song.preview {
                Button(action: {
                    isPlaying.toggle()
                }) {
                    //play button
                    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
                .padding()
                
                if isPlaying {
                    //play song if play button is pressed
                    SongPlayer(url: URL(string: previewURL))
                        .frame(width:1, height:1)
                }
            }
        }
        //same adjustments on the SongRow
        .background(Color.purple.opacity(0.2))
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        .shadow(radius: 5)
        .padding(8)
    }
}

//Shows view for the preview when playing song
struct SongPlayer: View {
    var url: URL?
    
    var body: some View {
        if let url = url {
            AudioPlayerView(url: url)
        } else {
            Text("Preview not available.")
                .foregroundColor(.red)
        }
    }
}

//Interacts with AVPlayer to play preview from URL
struct AudioPlayerView: View {
    var url: URL
    @State private var player = AVPlayer()
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .onAppear() {
                    player = AVPlayer(url: url)
                    player.play()
                }
        }
    }
}


#Preview {
    SongClicked(song: Seasons)
}
