//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dulce Itamar Vigueras Ballesteros on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false

    @State private var scoreTitle = ""
    
    @State private var score: Int = 0
    
    @State private var counter: Int = 1
    
   @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland","Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.20, blue: 0.45), location: 0.3)
            
            ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            
            VStack {

                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
             
                    .padding()
                    
                    ForEach(0..<3) { number in
                        Button {
                            //flag was tapped
                            flagTapped(number)
                           
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
      
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if counter != 8 {
                Button("Continue", action: askQuestion)
            } else {
                Button("Play again", action: playAgain)
            }
        } message: {
            
            if counter != 8 {
                Text("That's the flag of \(countries[correctAnswer]) ")
            
            } else {
                Text("Congrats! You've finished the game. Your final score is \(score)")
            }

          
        }
   

        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
       
        } else {
            scoreTitle = "Wrong!"
            score -= 1
        }

        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        counter += 1
    }
    
    

    
    func playAgain(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        counter = 1
        score = 0

    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
