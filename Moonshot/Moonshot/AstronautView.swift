//
//  AstronautView.swift
//  Moonshot
//
//  Created by Brandon Wong on 4/11/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
/*
                    ForEach(self.astronaut.missionsFlown, id: \.self) {
                        Text("\($0)")
                    }
 */
                    
                    Text(self.astronaut.description)
                        .padding()
                }
            }
        }
        .navigationTitle(Text(astronaut.name))
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
