//
//  Astronaut.swift
//  Moonshot
//
//  Created by Brandon Wong on 4/11/21.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String

/*
    var missions: [Mission] = Bundle.main.decode("missions.json")
    
    var missionsFlown: [String] {
        var list = [String]()
        
        for mission in missions {
            for crewMember in mission.crew {
                if name == crewMember.name {
                    list.append(mission.displayName)
                }
            }
        }

        return list
    }
*/
}
