//
//  ContentView.swift
//  Lab1_Justin_Yeh
//
//  Created by Justin Yeh on 2025-02-11.
//

import SwiftUI

struct ContentView: View {
    @State private var newNumber = Int.random(in: 1...100)
    @State private var numCorrectAnswers = 0
    @State private var numWrongAnswers = 0
    @State private var isAnswerCorrect: Bool? = nil
    var body: some View {
        VStack {
            Text("\(newNumber)")
                .font(.system(size: 70, weight: .bold))
                .padding()
            
            VStack {
                Button(action: { checkAnswer(isPrimeSelected: true) }) {
                    Text("Prime")
                        .padding()
                        .frame(width: 150, height: 75)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.title2)
                        .cornerRadius(12)
                }
                
                Button(action: { checkAnswer(isPrimeSelected: false) }) {
                    Text("Not Prime")
                        .padding()
                        .frame(width: 150, height: 75)
                        .font(.title2)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
            }            .padding()
        }
    }
    func checkAnswer(isPrimeSelected: Bool) {
        var isNumberPrime: Bool? = true        //let isActuallyPrime =  if num < 2 {
        if newNumber < 2 {
            isNumberPrime = false    }
        else {
            for i in 2..<newNumber {
                if newNumber % i == 0 {
                    isNumberPrime = false }
            }
            
            if isPrimeSelected == isNumberPrime {
                numCorrectAnswers = numCorrectAnswers + 1
                isAnswerCorrect = true
            } else {
                numWrongAnswers = numWrongAnswers + 1
                isAnswerCorrect = false
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
