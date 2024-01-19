//
//  ContentView.swift
//  Slots Demo
//
//  Created by Arnold Kebaso on 02/08/2023.
//

import SwiftUI

struct ContentView: View {
    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2, 0]
   @State private var credits = 1000
    private var betAmount = 5
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(red:200/255, green:143/255, blue:32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red:228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots ")
                        .bold()
                        .foregroundColor(.white)
                    
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                //Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                //Cards
                Spacer()
                HStack{
                    Spacer()
                   CardView()
                    
                   CardView()
                    
                   CardView()
                    
                    Spacer()
                }
                
                //Button
                Spacer()
                Button(action: {
                    //TO DO
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //check winnings
                    if self.numbers[0] == self.numbers[1] &&
                        self.numbers[1] == self.numbers[2]{
                        
                        
                        //You won
                        self.credits += self.betAmount * 10
                    }
                    else{
                        self.credits -= self.betAmount
                    }
                    }) {
                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                    }
                Spacer()
            }
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
