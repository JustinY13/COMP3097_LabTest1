//
//  ContentView.swift
//  Lab1_Justin_Yeh
//
//  Created by Justin Yeh on 2025-02-11.
//

import SwiftUI

struct ContentView: View {
    // Define All Variables
    @State private var newNumber = Int.random(in: 1...100)
    @State private var numCorrectAnswers = 0
    @State private var numWrongAnswers = 0
    @State private var timeLimit: Timer? = nil
    @State private var numAttempts = 0
    @State private var result = false
    @State private var correct: Bool? = nil
    @State private var showResult = false
    var body: some View {
        VStack {
            // Created the font and padding for the number that changes every 5 seconds
            Text("\(newNumber)")
                .font(.system(size: 70, weight: .bold))
                .padding()
            
            VStack {
                // Created button for Prime Number
                Button(action: { validateResponse(isPrimeSelected: true) }) {
                    Text("Prime")
                        .padding()
                        .frame(width: 150, height: 75)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.title2)
                        .cornerRadius(12)
                }
                // Created button for Non Prime Number
                Button(action: { validateResponse(isPrimeSelected: false) }) {
                    Text("Not Prime")
                        .padding()
                        .frame(width: 150, height: 75)
                        .font(.title2)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
            }
            .padding()
            // Created green checkmark and red X for correct and incorrect answers
            if let isCorrect = correct {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
            }
        }
        .onAppear { timer() }
        // Created Alert to show the Correct and Incorrect answers after 10 attempts
        .alert(isPresented: $showResult) {
            Alert(
                title: Text("Answer Results"),
                message: Text("Correct Answers: \(numCorrectAnswers)\nWrong Answers: \(numWrongAnswers)"),
                dismissButton: .default(Text("OK")) {
                    showResult = false
                    numAttempts = 0
                    numCorrectAnswers = 0
                    numWrongAnswers = 0
                }
            )
        }
    }
    // Created the function to move to the next number after
    func moveToNextNumber() {
            
        numAttempts = numAttempts + 1
        if numAttempts >= 10 {
            showResult = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            newNumber = Int.random(in: 1...100)
            correct = nil
            timer()
        }
    }
    // Created the timer to change the number after 5 seconds and to add an incorrect answer after the user doesn't respond
    func timer() {
        timeLimit?.invalidate()
        timeLimit = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) {
            _ in
            numWrongAnswers = numWrongAnswers + 1
            correct = false
            moveToNextNumber()
        }
    }
    // Check to see if the number is prime or not, if the user is correct then the number of correct answers goes up by 1, else the number of wrong answers goes up by 1
    func validateResponse(isPrimeSelected: Bool) {
        var isNumberPrime: Bool = true
        // if the number is less than 2, then the number is not considered prime
        if newNumber < 2 {
            isNumberPrime = false }
        else {
            // if the number is divisible by any other number than it is not considered prime
            for i in 2..<newNumber {
                if newNumber % i == 0 {
                    isNumberPrime = false
                    break }
            }
        }
        // if the answer is prime then add the number of correct answers by 1 and set the correct boolean to true
        if isPrimeSelected == isNumberPrime {
            numCorrectAnswers = numCorrectAnswers + 1
            correct = true
        } else {
            // if the number is not prime then add the number of wrong answers by 1 and set the correct boolean to false
            numWrongAnswers = numWrongAnswers + 1
            correct = false}
        moveToNextNumber()
    }
        
}

// Shows the layout
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
