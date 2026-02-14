//
//  Macros.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import Foundation

struct Macros {
    let calories: Double
    let protein: Double
    let carbs: Double
    let fat: Double
    
    static func calculate(
        sex: String,
        age: Int,
        height: Double,
        weight: Double,
        goalWeight: Double,
        activityLevel: Double
    ) -> Macros {
        
        // BMR
        let bmr: Double
        if sex == "Male" {
            bmr = (10.0 * weight) + (6.25 * height) - (5.0 * Double(age)) + 5.0
        } else {
            bmr = (10.0 * weight) + (6.25 * height) - (5.0 * Double(age)) - 161.0
        }
        
        // TDEE
        let tdee = bmr * activityLevel
        
        let targetCalories: Double
        if weight > goalWeight {
            targetCalories = tdee - 500  // Losing
        } else if weight < goalWeight {
            targetCalories = tdee + 300  // Gaining
        } else {
            targetCalories = tdee  // Maintaining
        }
        
        // Calculate macros
        let protein = weight * 2.2
        let fat = weight * 0.9
        let carbs = (targetCalories - (protein * 4) - (fat * 9)) / 4
        
        // Return
        return Macros(
            calories: targetCalories,
            protein: protein,
            carbs: carbs,
            fat: fat
        )
    }
}
