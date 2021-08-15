//
//  ContentView.swift
//  Moonshot
//
//  Created by Brandon Wong on 4/11/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingDate = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if showingDate == true {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.crewList)
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {
                    showingDate.toggle()
                }) {
                    showingDate == true ? Text("Show Crew") : Text("Show Dates")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
