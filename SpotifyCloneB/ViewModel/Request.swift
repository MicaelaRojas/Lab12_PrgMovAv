//
//  Request.swift
//  SpotifyCloneB
//
//  Created by MAC42 on 9/05/22.
//

import Foundation

class Request {
    
    let token = "BQCc6mNt8vistjcQDr5Zr8Q2c4BPy0YSplcoi90X0CPPKpnz5AKglLYOXSOd2gowDA9gHmNF4OdM8WA0utglJWgghuPjvvEKgvkKpQK6PE89-Dg3052dkS_ymJe7mmoG3cu3bTO-qGVA-1nnjSLlnzaWrPAJ93POXFaCPaRq3Gwwun8EXNAgFF6W9fIfgWvf2xitaQz1INF8lf7WGfD22JM"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data? {
        do {
            let urlParse = url.replacingOccurrences(of: " ", with: "%20")
            var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(urlParse)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        } catch {
            return nil
        }
    }
    
}
