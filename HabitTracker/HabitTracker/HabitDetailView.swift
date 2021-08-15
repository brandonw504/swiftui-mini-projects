//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Brandon Wong on 6/1/21.
//

import SwiftUI

struct HabitDetailView: View {
    @EnvironmentObject var habits: Habits
    
    let habitID: Int
    
    var body: some View {
        if habits.habits.count > habitID {
            Form {
                Section(header: Text("Description")) {
                    Text("\(habits.habits[habitID].description)")
                }
                
                Section {
                    Stepper("Completions: \(habits.habits[habitID].completions)", onIncrement: {
                        habits.habits[habitID].completions += 1
                    }, onDecrement: {
                        habits.habits[habitID].completions -= 1
                    })
                }
            }
            .navigationTitle("\(habits.habits[habitID].name)")
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habitID: 0)
    }
}
