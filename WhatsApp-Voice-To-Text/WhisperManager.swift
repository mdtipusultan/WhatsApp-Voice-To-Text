//
//  WhisperManager.swift
//  WhatsApp-Voice-To-Text
//
//  Created by MacBook Pro M1 Pro on 3/14/26.
//

import Foundation

class WhisperManager {
    
    static let shared = WhisperManager()
    
    private var context: OpaquePointer?
    
    func loadModel() {
        
        guard let modelPath = Bundle.main.path(
            forResource: "ggml-base.en",
            ofType: "bin"
        ) else { return }
        
        context = whisper_init_from_file(modelPath)
    }
}
