//
//  Request.swift
//  SpotifyCloneB
//
//  Created by Linder Anderson Hassinger Solano    on 7/05/22.
//

import Foundation

class Request {
    
    let token = "BQBXvsp5YfkpnXnqE_jaMEDH25k8lXrmmZeM-YWzD4W4uWKk7ymVGOV7SBg97VyJmdDE2Z6pSToBR8fcPQVlzlAGnXIQMVClh1dPqvErbDzOHg1PVblqJ2vubLveZaoirDjaJ4RpYV8W3dHRAHSiCptp1BIaXz_dLWUqGbVp7M9t_DwlBBuzk3BSI01gBYpGwi8e25YOtysB0FhiQ7Wio08"
    
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
