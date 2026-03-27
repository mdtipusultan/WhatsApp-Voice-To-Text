//
//  ShareViewController.swift
//  Voice Message to Text
//
//  Created by MacBook Pro M1 Pro on 3/13/26.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
    func saveAudioToSharedContainer(audioURL: URL) {

        let fileManager = FileManager.default

        guard let container = fileManager
            .containerURL(forSecurityApplicationGroupIdentifier: "com.office.WhatsApp-Voice-To-Text")
        else { return }

        let destination = container.appendingPathComponent("sharedAudio.opus")

        try? fileManager.copyItem(at: audioURL, to: destination)
    }
    
    func openMainApp() {

        let url = URL(string: "voiceai://processAudio")!

        var responder: UIResponder? = self

        while responder != nil {
            if responder?.responds(to: Selector(("openURL:"))) == true {
                responder?.perform(Selector(("openURL:")), with: url)
                break
            }
            responder = responder?.next
        }
    }

}
