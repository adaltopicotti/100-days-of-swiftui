//
//  MissionView.swift
//  Moonshot
//
//  Created by Adalto Picotti Junior on 18/02/23.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.launchDate?.formatted(date: .long, time: .omitted) ?? "N/A")
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        DividerLine()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        DividerLine()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    CrewListView(mission: mission, astronauts: astronauts)
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(crew, id: \.role) { crewMember in
//                                NavigationLink {
//                                    AstronautView(astronaut: crewMember.astronaut)
//                                } label: {
//                                    HStack {
//                                        Image(crewMember.astronaut.id)
//                                            .resizable()
//                                            .frame(width: 104, height: 72)
//                                            .clipShape(Capsule())
//                                            .overlay(
//                                                Capsule()
//                                                    .strokeBorder(.white, lineWidth: 1)
//                                            )
//
//                                        VStack(alignment: .leading) {
//                                            Text(crewMember.astronaut.name)
//                                                .foregroundColor(.white)
//                                                .font(.headline)
//
//                                            Text(crewMember.role)
//                                                .foregroundColor(.secondary)
//                                        }
//                                    }
//                                    .padding(.horizontal)
//                                }
//                            }
//                        }
//                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
//    init(mission: Mission, astronauts: [String: Astronaut]) {
//        self.mission = mission
//
//        self.crew = mission.crew.map { member in
//            if let astronaut = astronauts[member.name] {
//                return CrewMember(role: member.role, astronaut: astronaut)
//            } else {
//                fatalError("Missing \(member.name)")
//            }
//        }
//    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[3], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
