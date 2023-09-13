//
//  ContentView.swift
//  Moonshot
//
//  Created by Dulce Itamar Vigueras Ballesteros on 12/08/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    @State private var isGrid = true

    
    var body: some View {
        NavigationView {
            VStack {
                
               
                HStack {
                    Text("Moonshot").font(.title).bold()
                    Image(systemName: "moon")
                }

                    if isGrid {
                        GridLayout()
                            
                    } else {
                        ListLayout()
                            
                    }
                  
                    

            }
            .animation(.easeIn(duration: 2), value: isGrid)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isGrid.toggle()
                    } label: {
                        if isGrid {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                        } else {
                            Image(systemName: "square.grid.2x2.fill")
                        }
                    }.tint(.white)
                }
            })
            
            
            
            
//            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
