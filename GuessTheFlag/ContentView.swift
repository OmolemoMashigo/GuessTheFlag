//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button("button 1"){}
                .buttonStyle(.bordered)
            
            Button("button 2", role: .destructive){}
                .buttonStyle(.bordered)
            
            Button("button 3"){}
                .buttonStyle(.borderedProminent)
            
            Button("button 4", role: .destructive){}
                .buttonStyle(.borderedProminent)
        }
    }
    
    func executeDelete(){
        print("now deleting")
    }
}

#Preview {
    ContentView()
}
