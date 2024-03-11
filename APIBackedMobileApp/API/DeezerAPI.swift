//
//  DeezerAPI.swift
//  APIBackedMobileApp
//
//  Created by Ethan Wong on 2/16/24.
//  File for handling API interactions within app
//  Majority of code taken from APIIndex's API files and Hacking with Swift's tutorial
//  regarding sending codable data
//

import Foundation

let DEEZER_API_ROOT = "https://api.deezer.com"
let SEARCH_ENDPOINT = "\(DEEZER_API_ROOT)/search"

enum DeezerAPIError: Error {
    case unsuccessfulDecode
}

func searchDeezer(term: String) async throws -> DeezerResponse {
    //modified search url static string to match the response structures I wanted from DeezerAPI
    guard let url = URL(string: "\(SEARCH_ENDPOINT)?q=\(term)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(DeezerResponse.self, from: data) {
        return decodedPage
    } else {
        throw DeezerAPIError.unsuccessfulDecode
    }
}
