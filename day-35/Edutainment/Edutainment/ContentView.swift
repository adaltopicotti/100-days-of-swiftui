//
//  ContentView.swift
//  Edutainment
//
//  Created by Adalto Picotti Junior on 12/02/23.
//

import SwiftUI

struct Question {
    var question: String
    var answer: Int
    
    mutating func create(description: String, answer: Int) {
        question = description
        self.answer = answer
    }
    
    init(question: String, answer: Int) {
        self.question = question
        self.answer = answer
    }
}

struct ContentView: View {
    @State private var questions: [Question] = []
    
    @State private var multiplicationTable = 2
    @State private var questionsNumber = 5
    
    
    @State private var isGameStarted = true
    @State private var isEndGame = false
    @State private var answer = ""
    @State private var questionNumber = 0
    @State private var correctAnswers = 0
    
    let questionsOption = [5, 10, 20]
    
     func startGame() {
         questions.removeAll()
         for item in 0..<questionsNumber {
             let factor = Int.random(in: 1...12)
             let question = Question(question: "Question \(item + 1): What's the result of \(multiplicationTable) x \(factor) ", answer: multiplicationTable * factor)
             questions.append(question)
         }
        isGameStarted = true
    }
    
    func reset() {
        answer = ""
        questionNumber = 0
        isGameStarted = false
        isEndGame = false
    }
    
     func tapAnswer() {
         if questions[questionNumber].answer == Int(answer) {
             correctAnswers += 1
         }
         if questionNumber < (questionsNumber - 1) {
             questionNumber += 1
         } else {
             isEndGame = true
         }
         answer = ""
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 1)
                    .ignoresSafeArea()
                
                if isGameStarted && !questions.isEmpty {
                    VStack {
                        if isEndGame {
                            VStack(alignment: .leading) {
                                Text("The game is over")
                                    .font(.title)
                                Text("You got \(correctAnswers) correct answers!")
                                
                                Button {
                                    reset()
                                } label: {
                                    Text("Start a new game")
                                }
                                .frame(maxWidth: .infinity)
                                .frame(minHeight: 48)
                                .background(Color(red: 0.5, green: 0.5, blue: 1))
                                .foregroundColor(.primary)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.vertical, 16)
                                .padding(.horizontal, 8)
                            }
                            .padding(16)
                            .background(Color(red: 0.7, green: 0.7, blue: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        } else {
                            VStack(alignment: .leading) {
                                Text(questions[questionNumber].question)
                                TextField("Text", text: $answer)
                                    .padding(8)
                                    .background(.white)
                                    .cornerRadius(5)
                                Button {
                                    tapAnswer()
                                } label: {
                                    Text("Answer")
                                }
                                .frame(maxWidth: .infinity)
                                .frame(minHeight: 48)
                                .background(Color(red: 0.5, green: 0.5, blue: 1))
                                .foregroundColor(.primary)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.vertical, 16)
                                .padding(.horizontal, 8)
                            }
                            .padding(16)
                            .background(Color(red: 0.7, green: 0.7, blue: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                    }
                    .padding(16)
                } else {
                    VStack {
                        Text("Game options")
                            .foregroundColor(Color(red: 0.5, green: 0.2, blue: 1))
                            .font(.title)
                            
                        VStack {
                            VStack {
                                Text("Select the multiplication tables you want to pratice:")
                                Stepper("Table of \(multiplicationTable)", value: $multiplicationTable, in: 2...12)
                                    .padding(.horizontal, 8)
                            }
                            .padding(.vertical, 16)
                            .background(Color(red: 0.7, green: 0.7, blue: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            
                            VStack {
                                Text("Select the multiplication tables you want to pratice:")
                                HStack {
                                    ForEach(0..<questionsOption.count, id: \.self) { option in
                                        Button {
                                            withAnimation {
                                                questionsNumber = questionsOption[option]
                                            }
                                        } label: {
                                            Text("\(questionsOption[option]) questions")
                                        }
                                        .padding(2)
                                        .frame(maxWidth: .infinity)
                                        .frame(minHeight: 48)
                                        .background(questionsOption[option] == questionsNumber ? Color(red: 0.5, green: 0.2, blue: 1) : Color(red: 0.5, green: 0.5, blue: 1))
                                        .foregroundColor(.primary)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                                .padding(.horizontal, 8)
                            }
                            .padding(.vertical, 16)
                            .background(Color(red: 0.7, green: 0.7, blue: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Button {
                                startGame()
                            } label: {
                                Text("Start")
                            }
                            .frame(maxWidth: .infinity)
                            .frame(minHeight: 48)
                            .background(Color(red: 0.5, green: 0.5, blue: 1))
                            .foregroundColor(.primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.vertical, 16)
                            .padding(.horizontal, 8)
                            
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        .padding(16)
                    }
                    
                }
                
            }
            .navigationTitle("Edutainment")
            .foregroundColor(.black)
        }
        
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column, row + column + (row + row) + 2)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
