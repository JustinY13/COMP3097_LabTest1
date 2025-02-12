//
//  ContentView.swift
//  Lab1_Justin_Yeh
//
//  Created by Justin Yeh on 2025-02-11.
//

import SwiftUI

struct ContentView: View {
    @State private var newNumber = Int.random(in: 1...100)


    var body: some View {
        VStack {
            Text("\(newNumber)")
                .font(.system(size: 70, weight: .bold))
                .padding()
            
            VStack {
                Button {
                    Text("Prime")
                        .padding()
                        .frame(width: 150, height: 75)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.title2)
                        .cornerRadius(12)
                }
                
                Button {
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
        }
       

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
