//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//            //or use innit
////            .init(color: .white, location: 0.45),
////            .init(color: .black, location: 0.55)
//
//        
//        ], startPoint: .top, endPoint: .bottom)
        
        //RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        //AngularGradient(colors: [.red, .orange, .yellow,.green,.blue, .purple, .red], center: .center)
        
        Text("your content")
            .frame(maxWidth: .infinity, maxHeight:.infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
    }
}

#Preview {
    ContentView()
}
