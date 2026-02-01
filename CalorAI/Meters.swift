//
//  Meters.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//



import SwiftUI

struct Meters: View {
    var curr: Double = 1200
    var max: Double = 2500
    var trackingMacro: String = "Calories"
    var body: some View {
        VStack {
            HStack {
                Text(trackingMacro)
                Spacer()
                Text("\(Int(curr))/ \(Int(max))")
                    .foregroundColor(.gray)
            }
            
            ProgressView(value: curr, total: max)
                .tint(.blue)
        }
    }
}

#Preview {
    Meters()
}
