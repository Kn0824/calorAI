//
//  FoodEntryRow.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct FoodEntryRow: View {
    var entry: FoodEntry
    //var onModify: () -> Void
   
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // Food name
                Text(entry.name)
                VStack {
                    // Grams amount
                    Text("\(String(entry.grams))g")
                }.font(.caption2)
                    .foregroundColor(.green)
                HStack {
                    VStack {
                        // Calories label
                        Text("Calories")
                        // Calories amount
                        Text(String(entry.caloriesInt))
                    }.font(.caption2)
                    
                    VStack {
                        // Protein label
                        Text("Protein")
                        // Protein amount
                        Text(String(entry.protein))
                    }.font(.caption2)
                    
                    VStack {
                        // Carb label
                        Text("Carbs")
                        // Carb amount
                        Text(String(entry.carbs))
                    }.font(.caption2)
                    
                    VStack {
                        // Fats label
                        Text("Fats")
                        // Fats amount
                        Text(String(entry.fat))
                    }.font(.caption2)
                }
                
            }
            .font(.caption)
            Spacer()
            Button("Edit") {
                
            }
            .foregroundColor(.blue)
        }
        .padding(20)
    }
}

#Preview {
    FoodEntryRow(
        entry: FoodEntry(
            name: "Chicken Breast",
            calories: 165,
            protein: 31,
            carbs: 0,
            fat: 3.6,
            grams: 100
        )//,
        //onModify: {
        //}
    )
}
