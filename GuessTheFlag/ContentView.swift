//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    var body: some View {
        Button("show alert"){
            showingAlert = true
        }
        .alert("important message", isPresented: $showingAlert){
            Button("Delete", role: .destructive){}
            Button("Cancel", role: .cancel){}
        } message: {
            Text("read this")
        }
    }
    
}

#Preview {
    ContentView()
}
