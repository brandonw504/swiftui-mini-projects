//
//  ContentView.swift
//  Multiplication
//
//  Created by Brandon Wong on 4/10/21.
//

import SwiftUI

struct Question {
    var firstNumber = 0
    var secondNumber = 0
    var answer = 0
}

struct ContentView: View {
    @State private var maxMultiplication = 5
    @State private var questions = 0
    @State private var showingGame = false
    @State private var finishedGame = false
    @State private var answer = ""
    @State private var score = 0
    @State private var currentQuestion = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    let questionChoices = ["5", "10", "20", "All"]
    
    var body: some View {
        if !showingGame {
            Group {
                NavigationView {
                    Form {
                        Section(header: Text("Difficulty")) {
                            Stepper(value: $maxMultiplication, in: 5...12) {
                                Text("Up to \(maxMultiplication)")
                            }
                        }
                        
                        Section(header: Text("Number of questions")) {
                            Picker("\(questionChoices[questions]) questions", selection: $questions) {
                                ForEach(0..<questionChoices.count) {
                                    Text("\(questionChoices[$0])")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    .navigationTitle("Multiplication")
                    .navigationBarItems(trailing:
                        Button(action: runGame) {
                            Text("Play")
                        }
                    )
                }
            }
        } else {
            if !finishedGame {
                VStack(spacing: 30) {
                    Text("What is \(generateQuestions(number: maxMultiplication)[currentQuestion].firstNumber) x \(generateQuestions(number: maxMultiplication)[currentQuestion].secondNumber)?")
                    TextField("Answer", text: $answer, onCommit: checkQuestion)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                        newQuestion()
                    })
                }
            } else {
                VStack {
                    Text("You've finished!")
                    Text("Your score is \(score).")
                }
                .font(.largeTitle)
            }
        }
    }
    
    func runGame() {
        showingGame = true
    }
    
    func checkQuestion() {
        let number = Int(answer) ?? 0
        
        if number == generateQuestions(number: maxMultiplication)[currentQuestion].answer {
            score += 1
            alertTitle = "Correct"
            alertMessage = "Your score is now \(score)."
        } else {
            score -= 1
            alertTitle = "Incorrect"
            alertMessage = "Your score is now \(score)."
        }
        
        showingAlert = true
        answer = ""
        
        if currentQuestion == Int(questionChoices[questions]) ?? maxMultiplication * maxMultiplication {
            finishedGame = true
        }
    }
    
    func newQuestion() {
        currentQuestion += 1
    }
    
    func generateQuestions(number: Int) -> [Question] {
        let nQuestions = Int(questionChoices[questions]) ?? number * number
        var questions = [Question]()
        var new = [Question]()
        
        for i in 0..<number {
            for j in 0..<number {
                questions.append(Question(firstNumber: i, secondNumber: j, answer: i * j))
            }
        }
        
        for i in 0..<nQuestions {
            new.append(questions[i])
        }
        
        return new.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
