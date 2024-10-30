//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button{
            print("button was tapped")
        } label: {
            Label("edit", systemImage: "pencil")
                .padding()
                .foregroundColor(.blue)
                .background(.white)
        }
    }
    
    func executeDelete(){
        print("now deleting")
    }
}

#Preview {
    ContentView()
}
