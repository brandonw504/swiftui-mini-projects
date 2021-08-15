//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Brandon Wong on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var computerChoice = Int.random(in: 0 ..< 3)
    @State private var playerChoice = 0
    @State private var win = Bool.random()
    @State private var score = 0
    @State private var question = 1
    
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Score: \(score)")
                    .foregroundColor(.white)
                Text("Computer move: \(moves[computerChoice])")
                    .foregroundColor(.white)
                Text("Select the move that \(win ? "wins" : "loses") the game.")
                    .foregroundColor(.white)
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.moveTapped(number)
                        playerChoice = number
                    }) {
                        Text(moves[number])
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text("Your score is now \(score)."), dismissButton:
                .default(Text("Continue")) {
                    self.newQuestion()
                })
        }
    }
    
    func moveTapped(_ number: Int) {
        if number == correctAnswer() {
            alertTitle = "Correct"
            score += 1
        } else {
            alertTitle = "Wrong"
            score -= 1
        }
        
        showingAlert = true
    }
    
    func correctAnswer() -> Int {
        switch computerChoice {
        case 0:
            return win ? 1 : 2
        case 1:
            return win ? 2 : 0
        case 2:
            return win ? 0 : 1
        default:
            return 0
        }
    }
    
    func newQuestion() {
        computerChoice = Int.random(in: 0 ..< 3)
        win = Bool.random()
        question += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
