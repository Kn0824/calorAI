//
//  MealSection.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct MealSection: View {
    @Binding var meal: Meal
    //var onModifyEntry: (FoodEntry) -> Void
    var body: some View {
        Section() {
            // Meal summary
            HStack {
                Spacer()
                // Meal section title
                Text(meal.type.rawValue.capitalized)
                
                Spacer()
                
                // Protein
                VStack {
                    Text("Protein")
                    Text(String(meal.totalProtein))
                }
                
                // Carbs
                VStack {
                    Text("Carbs")
                    Text(String(meal.totalCarbs))
                }
                
                // Fats
                VStack {
                    Text("Fats")
                    Text(String(meal.totalFat))
                }
                
                Spacer()
                
                // Calories, bigger font
                Text("\(String(meal.totalCalories))cal")
                
                Spacer()
            }
            .font(.headline)
            // Entries
            ForEach(meal.entries) { entry in
                FoodEntryRow(entry: entry
                            // , onModify: {}
                )
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 0.45, green: 0.45, blue: 0.45))
                    )
                    .padding(5)
            }
            .onDelete { offsets in
                meal.entries.remove(atOffsets: offsets)}
            Spacer()
        }
        
    }
}

#Preview {
    @Previewable @State var meal = Meal(
        type: .breakfast,
        entries: [
            FoodEntry(name: "Oatmeal", calories: 150, protein: 5, carbs: 27, fat: 3, grams: 100),
            FoodEntry(name: "Banana", calories: 105, protein: 1.3, carbs: 27, fat: 0.4, grams: 118)
        ]
    )
    
    MealSection(meal: $meal//,
    //            onModifyEntry: {_ in}
    )
}
