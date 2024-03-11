//
//  Track.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//  File containing all structures forumlated to fit Deezer's JSON responses
//

import Foundation

//Structure for an entire response from Deezer API
struct DeezerResponse: Hashable, Codable {
    var data: [DeezerSong]
}

//Structure for one singular song in response from Deezer API
struct DeezerSong: Hashable, Codable {
    var id: Int
    var title: String
    var artist: DeezerArtist
    var album: DeezerAlbum
    var preview: String?
}

//Structure for an artist within Deezer API response (found within a song)
struct DeezerArtist: Hashable, Codable {
    var id: Int
    var name: String
    var picture: String?
}

//Structure for an album within Deezer API response (found within a song)
struct DeezerAlbum: Hashable, Codable {
    var id: Int
    var title: String
    var cover: String?
}

//tester variables
var Seasons = DeezerSong(id: 2515097851, title: "Seasons", artist: WaveToEarth, album: SummerFlows, preview: "https://cdns-preview-3.dzcdn.net/stream/c-33328f65b730e262cfb90340a09bc649-1.mp3")

var WaveToEarth = DeezerArtist(id: 72302562, name: "wave to earth", picture: "none")

var SummerFlows = DeezerAlbum(id: 504901261, title: "summer flows 0.02", cover: "https://api.deezer.com/album/504901261/image")
