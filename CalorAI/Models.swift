//
//  Models.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI
import Foundation

struct FoodEntry: Identifiable {
    let id = UUID()
    var name: String
    var calories: Double
    var protein: Double
    var carbs: Double
    var fat: Double
    var grams: Double
    
    // Computed property for display
    var caloriesInt: Int {
        Int(calories)
    }
}

// Meal category (breakfast, lunch, dinner)
struct Meal: Identifiable {
    let id = UUID()
    var type: MealType
    var entries: [FoodEntry]
    
    // Computed totals
    var totalCalories: Double {
        entries.reduce(0) { $0 + $1.calories }
    }
    
    var totalProtein: Double {
        entries.reduce(0) { $0 + $1.protein }
    }
    
    var totalCarbs: Double {
        entries.reduce(0) { $0 + $1.carbs }
    }
    
    var totalFat: Double {
        entries.reduce(0) { $0 + $1.fat }
    }
}

enum MealType: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner =  "Dinner"
    case snack = "Snack"
}

enum Sex: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String { self.rawValue }
}
    

