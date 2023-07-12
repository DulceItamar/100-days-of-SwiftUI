//
//  ContentView.swift
//  PaperScissorRock
//
//  Created by Dulce Itamar Vigueras Ballesteros on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var options = ["scissors-svgrepo-com", "paper-svgrepo-com", "rock-svgrepo-com"].shuffled()
    
    let images = [ "scissors-svgrepo-com", "paper-svgrepo-com", "rock-svgrepo-com"]
    
    @State private var player = ""
    @State private var computer = Int.random(in: 0...2)
    @State private var winner = ""
    @State private var match = ""
    
    @State private var scoreComputer: Int = 0
    @State private var scorePlayer: Int = 0
    @State private var counter: Int = 1
    
    @State private var isComputerTurn = false
    @State private var showingScore = false
    @State private var isSelected = false
    
    
    
    var body: some View {
        ZStack {
//            BackgroundColor
            RadialGradient(stops: [
                .init(color: Color(.white), location: 0.3),
                .init(color: Color(red: 237/255, green: 219/255, blue: 222/255), location: 0.3)
            ], center: .bottom, startRadius: 100, endRadius: 950).ignoresSafeArea()
            
            VStack {
                VStack {
//                    Title
                    PrincipalTexView(text: "Scissors, Rock, Paper!").padding(.top, 20)
                      
//                    Instructions
                    SecondTextView(text: "It's your turn! Select an option").padding(.init(top: 3, leading: 0, bottom: 20, trailing: 0))
                    
//                    Three buttons: scissors, paper and rock
                    HStack {
                        ForEach(images, id: \.self) { option in
                            Button {
                                isComputerTurn = true
                                whoIsTheWinnerRounds(player: option)
                                
                              
                               
                                print(option)
                            } label: {
                                SelectedImageView(image: option)
                            }

                        }
                    }
                    
                }
                

                SecondTextView(text: "It's computer turn!").padding(.top, 25)
                ZStack {
                    
                    ComputerFrameView()
//               Show the computer option (scissors, paper or rock) and the beggining is a happy face
                    if isComputerTurn == false {
                        
                        Image(systemName: "face.dashed.fill")
                            .resizable()
                            .foregroundColor(Color(red: 237/255, green: 219/255, blue: 222/255))
                            .frame(width: 200, height: 200)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(radius: 10, x: 10)
                            .padding(.horizontal, 5)
                        
                    } else {
                        SelectedComputerImageView(image: options[computer])
                    }
                   
                  
                   
                }
                
               
//          Score Title
                    PrincipalTexView(text: "Score").padding(.bottom,1)
                
                
                HStack {
//                     Player Score Title
                    scoreTextView(text: "Player").padding(.horizontal, 40)
//                    Computer Score Tile
                    scoreTextView(text: "Computer")
                }
                
            
                
                HStack {
//                    Score
                    FrameScoreView(score: scorePlayer).padding()
                    FrameScoreView(score: scoreComputer)
                }
            }
        }
        .alert(winner, isPresented: $showingScore) {
            if counter != 10 {
                Button("Continue", action: nextRound)
            } else {
                Button("Play Again", action: playAgain)
                
            }
        } message: {
            if counter != 10 {
                Text("Your score is \(scorePlayer) and computer score is \(scoreComputer)")
            } else {
                Text("Game is over. \(match). Your final score is \(scorePlayer) and computer score is \(scoreComputer)")
            }
        }
    }
    
//    Who is the winner in this round? Computer or player?
    func whoIsTheWinnerRounds( player: String) {
        
    
        let computer1 = options[computer]
        if computer1 == player {
            winner =  "It's a tie!"
            print("This round is a tie")
            
        } else if computer1 == "scissors-svgrepo-com" && player == "paper-svgrepo-com" || computer1 == "rock-svgrepo-com" && player == "scissors-svgrepo-com"{
            winner = "This round is for computer!"
            scoreComputer += 10
            print("This round is for computer")
        } else if computer1 == "scissors-svgrepo-com" &&  player == "rock-svgrepo-com" || computer1 == "rock-svgrepo-com" && player == "paper-svgrepo-com" {
            winner = "This round is for you"
            scorePlayer += 10
            print("This round is for you")
        }
        
        showingScore = true
        
    }

//    New Match
    func playAgain(){
        
        scorePlayer = 0
        scoreComputer = 0
        counter = 1
        isComputerTurn = false
    }

    func nextRound(){
        options.shuffle()
        isComputerTurn = false
        counter += 1
        
        
        
        if counter == 10 && scorePlayer > scoreComputer {
            match = "Your are the winner!"
            
        } else if counter == 10 && scorePlayer < scoreComputer {
            match = "Computer is the winner!"
        } else if counter == 10 && scorePlayer == scoreComputer {
            match = "It's a tie. Better luck next time"
            
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
