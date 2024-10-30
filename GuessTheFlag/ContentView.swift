//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("delete", action: executeDelete)
    }
    
    func executeDelete(){
        print("now deleting")
    }
}

#Preview {
    ContentView()
}
