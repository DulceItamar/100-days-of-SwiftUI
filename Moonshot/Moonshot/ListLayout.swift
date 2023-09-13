//
//  ListLayout.swift
//  Moonshot
//
//  Created by Dulce Itamar Vigueras Ballesteros on 13/09/23.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
 
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLauchDate)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .opacity(0.5)
                                
                        }
                    }
                    
                }
                
               
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.visible)
                
            }

            .listStyle(.plain)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
           
            
        }
    }
    
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
    }
}
