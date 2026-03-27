//
//  TranscriptionService.swift
//  WhatsApp-Voice-To-Text
//
//  Created by MacBook Pro M1 Pro on 3/13/26.
//

import Foundation

class TranscriptionService {
    
    static let shared = TranscriptionService()
    
    func transcribeAudio(fileURL: URL) async throws -> String {
        
        let apiKey = "YOUR_API_KEY"
        let endpoint = URL(string: "https://api.openai.com/v1/audio/transcriptions")!
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let audioData = try Data(contentsOf: fileURL)
        
        let (data, _) = try await URLSession.shared.upload(for: request, from: audioData)
        
        let response = try JSONDecoder().decode(WhisperResponse.self, from: data)
        
        return response.text
    }
}

struct WhisperResponse: Codable {
    let text: String
}
