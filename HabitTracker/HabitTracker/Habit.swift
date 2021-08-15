//
//  Habit.swift
//  HabitTracker
//
//  Created by Brandon Wong on 6/1/21.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id: Int
    var completions: Int
    var name: String
    var description: String
}

class Habits: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Habit].self, from: habits) {
                self.habits = decoded
                return
            }
        }
        
        self.habits = []
    }
}
