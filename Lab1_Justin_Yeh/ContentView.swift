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
    var body: some View {
        VStack {
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
            if let isCorrect = correct {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
            }
        }
        .onAppear { timer() }
    }
    func moveToNextNumber() {
        numAttempts = numAttempts + 1
        //if numAttempts >= 10 {
          //  result = true
         //   return
       // }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            newNumber = Int.random(in: 1...100)
            correct = nil
            timer()
        }
    }
    func timer() {
        timeLimit?.invalidate()
        timeLimit = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) {
            _ in
            numWrongAnswers = numWrongAnswers + 1
            correct = false
            moveToNextNumber()
        }
    }
    func validateResponse(isPrimeSelected: Bool) {
        var isNumberPrime: Bool = true
        
        if newNumber < 2 {
            isNumberPrime = false    }
        else {
            for i in 2..<newNumber {
                if newNumber % i == 0 {
                    isNumberPrime = false
                    break }
            }
        }
        if isPrimeSelected == isNumberPrime {
            numCorrectAnswers = numCorrectAnswers + 1
            correct = true
        } else {
            numWrongAnswers = numWrongAnswers + 1
            correct = false}
        
        moveToNextNumber()        }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
