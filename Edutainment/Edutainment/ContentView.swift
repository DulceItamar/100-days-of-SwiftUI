//
//  ContentView.swift
//  Edutainment
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/07/23.
//

import SwiftUI


struct Background: View {
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .opacity(0.9)
        }
    }
}

struct AppButton: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    @State var Table: Int // Example: 4
    @State var selectedQuestions: Int //Example: 5
    @State private var showPlay = false
    
    let questions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("animalsBackground").ignoresSafeArea()
                
                VStack{
                    
                    ZStack {
                        Background(width: 380, height: 60)
                   
                        Text("Edutainment")
                            .font(.custom("K26ToyBlocks123", size: 36))
                            .foregroundColor(.brown)
                       
                    }.padding()
                    
                    ZStack {
                        
                        Background(width: 350, height: 400)
                        
                        
                        
                        VStack {

                            Text("Select a Multiplication Table: ")
                                .font(.custom("Montserrat-Bold", size: 20))
                                
                            
                            HStack{
                                Text("x \(Table)")
                                    .padding(20)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .font(.custom("Montserrat-Bold", size: 24))
                                    .animation(.easeIn(duration: 0.5), value: Table)
                                
                                Stepper("Table", value: $Table, in: 2...12)
                                    .frame(width: 150)
                                    .labelsHidden()
                                    .padding(.bottom,20)

                            }
                            .frame(width: 300)
                            
                            Text("How many questions?")
                                .font(.custom("Montserrat-Bold", size: 24))
                            
                            Picker("Questions", selection: $selectedQuestions) {
                                ForEach(questions, id: \.self) { option in
                                    Text("\(option)")
                                }
                            }.pickerStyle(.segmented)
                                .frame(width: 200, alignment: .center)
                            
                            Button {
                                showPlay = true
                            } label: {
                        
                                HStack {
                                    Image("chick").resizable()
                                        .frame(width: 50, height: 50)
                                    Text("Play")
                                        .foregroundColor(.brown)
                                        .font(.custom("Montserrat-Bold", size: 18))
                                        .padding()
                                }
//
                                   
                    
                            }
                            .buttonStyle(AppButton())
                            .navigationDestination(isPresented: $showPlay, destination: {
                                PlayView(selectedTable: ContentView(Table: Table, selectedQuestions: selectedQuestions))
                            })
                            .padding()

                        }.foregroundColor(.brown)
                    }
                    
                  
                    
                  
              
                }
            }
           
            .padding()
            .navigationBarBackButtonHidden(true) 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(Table: 4, selectedQuestions: 10)
    }
}
