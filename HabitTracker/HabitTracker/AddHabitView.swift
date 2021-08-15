//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Brandon Wong on 6/1/21.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var description = ""
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Habit")
            .navigationBarItems(trailing:
                Button("Save") {
                    if !name.isEmpty && !description.isEmpty {
                        habits.habits.append(Habit(id: habits.habits.count, completions: 0, name: name, description: description))
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showingAlert = true
                    }
                }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("You need to fill out all the fields."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
