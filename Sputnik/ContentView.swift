//
//  ContentView.swift
//  Sputnik
//
//  Created by Peter Deal on 2020-07-08.
//  Copyright © 2020 Peter Deal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var document: GeminiDocument
    
    var body: some View {
        VStack {
            HStack {
                Button( action: {
                    self.document.back()
                } ) {
                    Text("←")
                }
                Button( action: {
                    self.document.forward()
                } ) {
                    Text("→")
                }
                TextField("Gemini Site", text: $document.navBarUrl, onCommit: browse)
            }
            .padding(.horizontal, 6)
            .padding(.top, 6)
            
            GeminiDocumentView(document: document)
        }
    }
    
    func browse() {
        if let url = URL(string: document.navBarUrl) {
            document.navigate(url.standardized, nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
