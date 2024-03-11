//
//  SongRow.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//

import SwiftUI


struct SongList: View {
    @State private var results = [DeezerSong]()
    
    var body: some View {
        List(results, id: \.id) { song in
            VStack(alignment: .leading) {
                SongRow(result:song)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://api.deezer.com/chart/0/tracks") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(DeezerResponse.self, from: data) {
                results = decodedResponse.data
            }
        } catch {
            print("Invalid data")
        }
    }
    
}



#Preview {
    SongList()
}
