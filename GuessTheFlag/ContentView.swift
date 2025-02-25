//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omolemo Mashigo on 2024/10/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var userScore = 0
    @State private var questionCount = 0
    
    @State private var gameOver = false
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var animationAmount = 0.0
    @State private var tappedFlagIndex: Int? = nil // Track which flag is tapped
    @State private var fadeOutFlags = false // Control fade-out effect
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Text("Guess the flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15){
                    VStack{
                        Text("tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                            
                        } label: {
                            FlagImage(image: countries[number])
                                .rotation3DEffect(
                                    .degrees((tappedFlagIndex == number ? animationAmount : 0)),axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .opacity((fadeOutFlags && tappedFlagIndex != 0 ? 0.25 : 1))
                
                        }
                        .disabled(fadeOutFlags) // Disable buttons during fade-out
                        
                    }
                }
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct"{
                Text("your score is \(userScore)")
            }
            else {
                Text("Wrong! That’s the flag of \(countries[correctAnswer])")
            }
        }
        
       
        
        .alert("Game Over", isPresented: $gameOver){
            Button("Continue"){
                userScore = 0
                resetGame()
            }
            
        } message: {
            Text("your final score is \(userScore)")
            
        }
            

    }
    
    func flagTapped(_ number: Int){
        tappedFlagIndex = number // Set the tapped flag index
        fadeOutFlags = true // Activate fade-out effect
        
        questionCount += 1
        
        if number == correctAnswer{
            scoreTitle = "Correct"
            userScore += 1
        }
        else {
            scoreTitle = "Incorrect"
        }
        
        withAnimation(.spring(duration: 1, bounce: 0.3)){
            animationAmount += 360
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showingScore = true
        }
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<2)
        
        if questionCount == 8{
            gameOver = true
            resetGame()
        }
        tappedFlagIndex = nil
        animationAmount = 0
        fadeOutFlags = false
    }
    
    func resetGame(){
        questionCount = 0
    }
    
}

struct FlagImage: View{
   
    var image: String
    
    var body: some View{
        Image(image)
        .clipShape(.capsule)
        .shadow(radius: 5)
    }
   
}



#Preview {
    ContentView()
}
