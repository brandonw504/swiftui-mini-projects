//
//  ContentView.swift
//  HabitTracker
//
//  Created by Brandon Wong on 6/1/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habits) { habit in
                    NavigationLink(destination: HabitDetailView(habitID: habit.id)) {
                        VStack(alignment: .leading) {
                            Text(habit.name)
                                .font(.headline)
                            Text(habit.description)
                        }
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("Habits")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
        .environmentObject(habits)
    }
    
    func removeRows(at offsets: IndexSet) {
        offsets.forEach {
            habits.habits.remove(at: $0)
            for i in $0 ..< habits.habits.count {
                habits.habits[i].id -= 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
