//
//  HomeView.swift
//  WhatsApp-Voice-To-Text
//
//  Created by MacBook Pro M1 Pro on 3/13/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {

        VStack(spacing: 30) {

            Image(systemName: "waveform.circle.fill")
                .font(.system(size: 70))
                .foregroundStyle(.blue)

            Text("Voice to Text")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Share WhatsApp voice messages to instantly convert them to text.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

        }
        .padding()
    }
}
#Preview {
    HomeView()
}

struct ResultView: View {

    let transcript: String

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {

            Text("Transcription")
                .font(.title2)
                .fontWeight(.semibold)

            ScrollView {
                Text(transcript)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
            }

            HStack {

                Button("Copy") {}

                Spacer()

                Button("Share") {}
            }
        }
        .padding()
    }
}
