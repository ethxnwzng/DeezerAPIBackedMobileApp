//
//  SongView.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//  Most code taken from APIDex's APIView files as well as Hacking with Swift's tutoral video about sending Codable data to help with loading  search results from Deezer Api
//
import SwiftUI

struct SongView: View {
    var searchTerm: String
    @State private var loading = false
    @State private var errorOccurred = false
    @State private var results: [DeezerSong] = []

    var body: some View {
        NavigationView {
            VStack {
                if loading {
                    ProgressView()
                } else if errorOccurred {
                    Text("Loading...")
                } else {
                    List(results, id: \.id) { item in
                        //added NaviLink to allow users to click on song
                        NavigationLink(destination: SongClicked(song: item)) {
                            SongRow(result: item)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await loadSearchResults()
                    }
                }
            }
            
            .task(id: searchTerm) {
                await loadSearchResults()
            }
        }
        
    }

    //function that loads results from DeezerAPI
    func loadSearchResults() async {
        errorOccurred = false
        loading = true

        do {
            let searchPage = try await searchDeezer(term: searchTerm)
            results = searchPage.data
        } catch {
            errorOccurred = true
            debugPrint("Unexpected error: \(error)")
        }

        loading = false
    }
}

#Preview {
    SongView(searchTerm: "Loathe")
}
