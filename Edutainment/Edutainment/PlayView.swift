//
//  SetView.swift
//  Edutainment
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/07/23.
//

import SwiftUI

struct BackgroundCircle: View {
    @State var size: CGFloat
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundColor(Color(red: 145/255, green: 189/255, blue: 245/255))
            .shadow(radius: 0, x: 5, y: 5)
    }
}


struct PlayView: View {
    
    let gridItem =  [GridItem(.adaptive(minimum: 60))]
    
//Values for calculating a right answer
    @State var selectedTable: ContentView
    @State var randomValue = Int.random(in: 1...12)
    
    
//   For selecting a correct option
    @State var  selectedButtton = -1
    @State var  counter: Int = 1
    @State var isTapped = false
    @State var startAgain = false
    
// To make a tree options by answering
    @State var buttons = [Int]()
    var buttonOptions : [Int] {
        

        var buttons = [Int]()
        
        let rightButton = randomValue * selectedTable.Table
        buttons.append(rightButton)
        
        var i: Int = 0
        for _ in 0...1 {
            i = Int.random(in: 1...100)
            buttons.append(i)
        }
        return buttons.shuffled()
    }
    
//    To alert messages
    @State var scoreTitle = ""
    @State var totalScore: Int = 0
    @State var goodScore: Int = 0
    @State var badScore: Int = 0
    @State var showingScore = false
    
//    Header questions
    @State var counterHeader = 1
    
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                LinearGradient(stops: [
                    .init(color: Color(red: 145/255, green: 189/255, blue: 245/255), location: 0.5),
                    .init(color: Color(red: 219/255, green: 249/255, blue: 203/255), location: 0.5)], startPoint: .top , endPoint: .bottom).ignoresSafeArea()
                
                
                VStack {
                    
                    Text("Question number:")
                        .font(.custom("Montserrat-Bold", size: 20))
                    
                    HStack {
                        LazyVGrid(columns: gridItem) {
                            ForEach(1...selectedTable.selectedQuestions, id: \.self) { question in
                                
                                ZStack {
                                    Image("snake")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .opacity(question == counterHeader ? 1 : 0.3)
                                        .scaleEffect(question == counterHeader ? 1.1:0)
                                        .animation(.linear, value: question)
                                    
                                    Text("\(question)")
                                        .font(.custom("Montserrat-Bold", size: 20))
                                        .foregroundColor(question == counterHeader ? .black: .gray)
                                }
                            }
                        }
                        
                        .frame(width: 360, alignment: .center)
                        .padding(.bottom, 10)
                    }
                    .animation(.easeIn(duration: 0.5), value: counterHeader)
                    
                    
                    ZStack {
                        Background(width: 300, height: 250)
                        
                        
                        VStack {
                            
                            Text("What is the right answer?").font(.custom("Montserrat-Regular", size: 20))
                            
                            Text("\(selectedTable.Table) x \(randomValue)")
                                .font(.custom("Montserrat-Bold", size: 36))
                                .padding(.vertical,10)
                            
                            HStack{
                                ForEach(buttonOptions, id: \.self) {option in
                                    Button {
                                        print(option)
                                        buttonTapped(option)
                                    } label: {
                                        ZStack {
                                            BackgroundCircle(size: 60).padding(.horizontal,10)
                                            
                                            Text("\(option)")
                                                .font(.custom("Montserrat-Bold", size: 24))
                                        }
                                        
                                    }.tint(.white)
                                    
                                }
                            }
                            
                        }
                    }
                    
                    HStack {
                        
                     
                        ZStack {
                            Background(width: 100, height: 80)
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.red)
                                .shadow(radius: 5, x: 5, y: 5)
                        }
                            
                  
                        
                       
                        ZStack {
                            Background(width: 100, height: 80)

                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            .shadow(radius: 5, x: 5, y: 5)
                        }
                        
                        ZStack {
                            Background(width: 120, height: 80)

                            Text("Score")
                                .font(.custom("Montserrat-Bold", size: 30))
                                .shadow(radius: 5, x: 5, y: 5)
                           
                        }

                    }
                    
                    
                    HStack {
                        
                        ZStack {
                            //                    BackgroundCircle(size: 120)
                            Image("parrot")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                            Text("\(badScore)")
                                .font(.custom("Montserrat-Bold", size: 30))
                                .foregroundColor(.black)
                                
                        }
                        
                        ZStack {
                            //                    BackgroundCircle(size: 120)
                            Image("snake")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                            Text("\(goodScore)")
                                .font(.custom("Montserrat-Bold", size: 30))
                                .foregroundColor(.black)
                                
                        }.padding(.horizontal,14)
                        
                        ZStack {
                            //                    BackgroundCircle(size: 120)
                            Image("giraffe")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                            Text("\(totalScore)")
                                .font(.custom("Montserrat-Bold", size: 30))
                                .foregroundColor(.black)
                        }
                        
                        
                        //                .animation(.easeIn, value: score)
                        
                        .animation(.linear, value: totalScore)
                    }
                    
                    
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                if counter != selectedTable.selectedQuestions {
                    Button("Continue", action: nextQuestion)
                } else {
                    Button("Play again", action: playAgain)
                    
                }
            } message: {
                if counter != selectedTable.selectedQuestions {
                    Text("You can do it. Your current score is \(totalScore).")
                } else {
                    Text("Game is over. Your total score is \(totalScore). Your  right answers are \(goodScore) and bad ones are \(badScore)")
                }
            }
            .navigationDestination(isPresented: $startAgain, destination: {
                ContentView(Table: selectedTable.Table, selectedQuestions: selectedTable.selectedQuestions)
            })
            .navigationBarBackButtonHidden(true) 
            

        }
        
    }
    
    func buttonTapped(_ option: Int ){
        selectedButtton = option
        
        let rightButton = randomValue * selectedTable.Table
        
       
        if option ==  rightButton {
            scoreTitle = "Correct!"
            totalScore += 10
            goodScore += 1
            
        } else {
            scoreTitle = "Good luck for next one"
            totalScore -= 10
            badScore += 1
           
        }
        
        showingScore = true

        counterHeader += 1
//        Test
        randomValue = Int.random(in: 1...12)
     
    }
    

    
    func nextQuestion() {
         randomValue = Int.random(in: 1...12)
        counter += 1
    }
    

    
    func playAgain(){
       
        if counter == counterHeader{
            scoreTitle = "Game is over. Well done"
        }
        counter = 1
        totalScore = 0
        badScore = 0
        goodScore = 0
        counterHeader = 1
        startAgain = true
        
        
        
    }
    

    
}






struct SetView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        PlayView(selectedTable: ContentView(Table: 4, selectedQuestions: 5))
        
        
    }
}
