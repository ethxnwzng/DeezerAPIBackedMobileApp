//
//  SearchPage.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/18/24.
//

import SwiftUI

import SwiftUI

//SearchBar used within the SearchPage view
struct SearchBar: View {
    //Term being searched by user
    @Binding var searchTerm: String
    //True if user is searching, else false
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            //Text within search bar and search bar adjustments
            TextField("Search for songs", text: $searchTerm)
                .padding(8)
                .background(Color.purple)
                .cornerRadius(8)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: isSearching ? 0 : 10))
            //turns isSearching to true when user clicks onto TextField
                .onTapGesture {
                    isSearching = true
                }
            
            //if isSearching, create a cancel button which resets searchTerm
            if isSearching {
                Button("Cancel") {
                    isSearching = false
                    searchTerm = ""
                }
                .foregroundColor(.purple)
                //padding to move cancel button away from edge of the screen
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

import SwiftUI


struct SearchPage: View {
    //Term being searched by user, initially empty
    @State private var searchTerm: String = ""
    //True if user is searching, false otherwise
    @State private var isSearching: Bool = false

    var body: some View {
       
            VStack {
                Text("powered by")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    //move text away from top of the screen
                    .padding(.top, 10)

                Image("DeezerLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                //create search bar
                SearchBar(searchTerm: $searchTerm, isSearching: $isSearching)
                    .padding(.top, 10)
                
                //load songs based on user's searchterm
                SongView(searchTerm: searchTerm)
                    .background(Color.gray.edgesIgnoringSafeArea(.all))

                Spacer()
            }

            .background(Color.gray.edgesIgnoringSafeArea(.all))
        
    }
}

#Preview {
    SearchPage()
}
