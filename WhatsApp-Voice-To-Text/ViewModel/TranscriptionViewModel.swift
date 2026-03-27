//
//  TranscriptionViewModel.swift
//  WhatsApp-Voice-To-Text
//
//  Created by MacBook Pro M1 Pro on 3/13/26.
//

import Foundation
import SwiftUI

//@MainActor
//class TranscriptionViewModel: ObservableObject {
//    
//    @Published var transcriptText: String = ""
//    @Published var isLoading = false
//    
//    func processAudio(url: URL) {
//        Task {
//            do {
//                isLoading = true
//                let text = try await TranscriptionService.shared.transcribeAudio(fileURL: url)
//                transcriptText = text
//                isLoading = false
//            } catch {
//                print(error)
//                isLoading = false
//            }
//        }
//    }
//}

@MainActor
class TranscriptionViewModel: ObservableObject {

    @Published var text = ""
    
    func transcribe(url: URL) {
        
        DispatchQueue.global().async {
            
            let result = WhisperManager.shared.transcribe(
                audioPath: url.path
            )
            
            DispatchQueue.main.async {
                self.text = result
            }
        }
    }
}
