//
//  MissionView.swift
//  Moonshot
//
//  Created by Dulce Itamar Vigueras Ballesteros on 03/09/23.
//

import SwiftUI

struct MissionView: View {
    
    struct CreMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CreMember]
 
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    HStack {
                        Image(systemName: "calendar").resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text(mission.largeFormattedLaunchDate)
                            .font(.headline)
                            
                    }
                    .padding(.top, 10)
                                            
                    DividerLineView()
                    
                    VStack {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                        Text(mission.description)
                        
                        DividerLineView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom,5)
                            
                    }
                    .padding(.horizontal)
                   
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(.white, lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                }
                .padding(.bottom)
            }
         
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name]{
                return CreMember(role: member.role
                                 , astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
        
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
