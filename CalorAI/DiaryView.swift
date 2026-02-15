//
//  DiaryView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct DiaryView: View {
    @Binding var meals: [Meal]
    var currCal: Double {
        meals.reduce(0) { $0 + $1.totalCalories }
    }
    var currProtein: Double {
        meals.reduce(0) { $0 + $1.totalProtein }
    }
    var currCarbs: Double {
        meals.reduce(0) { $0 + $1.totalCarbs }
    }
    var currFat: Double {
        meals.reduce(0) { $0 + $1.totalFat }
    }
    var maxCal: Double
    var maxProtein: Double
    var maxCarbs: Double
    var maxFat: Double
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(red: 0.2, green: 0.3, blue: 0.6)
                    .ignoresSafeArea()
                
                VStack {
                    // Calories
                    Meters(curr: currCal, max: maxCal, trackingMacro: "Calories")
                    HStack {
                        // Protein
                        Meters(curr: currProtein, max: maxProtein, trackingMacro: "Protein")
                        Spacer()
                        // Carbs
                        Meters(curr: currCarbs, max: maxCarbs, trackingMacro: "Carbs")
                        Spacer()
                        // Fat
                        Meters(curr: currFat, max: maxFat, trackingMacro: "Fats")
                    }
                    .font(.caption)
                    .padding(.vertical, 10)
                    
                    
                    
                    
                    List {
                        ForEach($meals) { $meal in
                            MealSection(
                                meal: $meal
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray)
                            )
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    /*.foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)*/
                }
                .foregroundColor(.white)
            }
        }
    }

}

#Preview {
    @Previewable @State var meals: [Meal] = [
        Meal(type: .breakfast, entries: [
            FoodEntry(name: "Oatmeal", calories: 150, protein: 5, carbs: 27, fat: 3, grams: 100)
        ]),
        Meal(type: .lunch, entries: []),
        Meal(type: .dinner, entries: [])
    ]
    DiaryView(meals: $meals, maxCal: 2500.0, maxProtein: 180.0, maxCarbs: 250.0, maxFat: 70.0)
}

