//
//  ContentView.swift
//  BrainTrain
//
//  Created by Adalto Picotti Junior on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var shouldWin = Bool.random()
    
    
    @State var appMove = Int.random(in: 0...2)
    
    
    
    var body: some View {
        ZStack {
            Color(red: 0.3, green: 0.1, blue: 0.6)
            VStack {
                Text("Score: \(score)")
                    .font(.title.bold())
                
                Spacer()
                
                Text("Select the move to \(shouldWin ? "WIN" : "LOSE") against \(moves[appMove])")
                    .font(.system(size: 18))
                
                VStack {
                    
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(moves, id: \.self) { move in
                            Button {
                                moveTapped(move)
                            } label: {
                                Text(move)
                                    .foregroundColor(Color.primary)
                                    .font(.system(size: 16).bold())
                                    .padding()
                                    .frame(width: 100, height: 100)
                                    .background(.thinMaterial)
                                    .cornerRadius(20)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                }
                Spacer()
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func moveTapped(_ move: String) {
        var won = false
        
        if move == "Scissors" && moves[appMove] == "Rock" {
            won = false
        }
        if move == "Scissors" && moves[appMove] == "Paper" {
            won = true
        }
        
        if move == "Rock" && moves[appMove] == "Scissors" {
            won = true
        }
        if move == "Rock" && moves[appMove] == "Paper" {
            won = false
        }
        
        if move == "Paper" && moves[appMove] == "Scissors" {
            won = false
        }
        if move == "Paper" && moves[appMove] == "Rock" {
            won = true
        }
        
        if move == moves[appMove] {
            won = false
            scoreTitle = "Wrong!"
            showingScore = true
            return
        }
        
        if shouldWin {
            if won {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong!"
            }
        } else {
            if won {
                scoreTitle = "Wrong!"
            } else {
                scoreTitle = "Correct"
                score += 1
            }
        }
        
        showingScore = true

    }
    
    func askQuestion() {
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
