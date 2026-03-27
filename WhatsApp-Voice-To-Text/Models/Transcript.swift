//
//  Transcript.swift
//  WhatsApp-Voice-To-Text
//
//  Created by MacBook Pro M1 Pro on 3/13/26.
//

import Foundation

struct Transcript: Identifiable {
    let id = UUID()
    let originalAudioURL: URL
    let text: String
    let summary: String?
    let date: Date
}
