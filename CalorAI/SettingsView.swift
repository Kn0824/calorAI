//
//  SettingsView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newName: String
    @Binding var newAge: Int
    @Binding var newSex: String
    @Binding var newHeight: Double
    @Binding var newCurrWeight: Double
    @Binding var newGoalWeight: Double
    @Binding var activityLevel: Double
    var body: some View {
        ZStack {
            // Background
            Color(red: 0.2, green: 0.3, blue: 0.6)
                .ignoresSafeArea()
            VStack {
                Text("Settings")
                    .font(.title)
                    .foregroundStyle(.white)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Change Name: ")
                            .foregroundStyle(.white)
                        TextField("", text: $newName)
                            .textFieldStyle(.roundedBorder)
                            .border(.black)
                    }
                    .padding()
                    HStack {
                        Text("Change Age: ")
                            .foregroundStyle(.white)
                        TextField("", value: $newAge, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .border(.black)
                    }
                    HStack {
                        Text("Change Sex: ")
                            .foregroundStyle(.white)
                        Picker("Sex", selection: $newSex) {
                            Text("Male").tag("Male")
                            Text("Female").tag("Female")
                        }
                        .pickerStyle(.segmented)
                        .colorInvert()
                    }
                    HStack {
                        Text("Change Height: ")
                            .foregroundStyle(.white)
                        TextField("", value: $newHeight, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .border(.black)
                    }
                    .padding()
                    HStack {
                        Text("Change Current Weight: ")
                            .foregroundStyle(.white)
                        TextField("", value: $newCurrWeight, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .border(.black)
                    }
                    .padding()
                    HStack {
                        Text("Change Goal Weight: ")
                            .foregroundStyle(.white)
                        TextField("", value: $newGoalWeight, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .border(.black)
                    }
                    .padding()
                    
                    VStack {
                        Text("Activity Level")
                            .foregroundStyle(.white)
                        Picker("ActivityLevel", selection: $activityLevel) {
                            Text("Sedentary").tag(1.2)
                            Text("Light").tag(1.375)
                            Text("Moderate").tag(1.55)
                            Text("Very").tag(1.725)
                            Text("Extreme").tag(1.9)
                        }
                        .pickerStyle(.segmented)
                        .colorInvert()
                    }
                }
                .padding(10)
                HStack {
                    Spacer()
                    Button("Save Changes") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray)
                    .font(.subheadline)
                    .padding()
                }
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    @Previewable @State var newName = ""
    @Previewable @State var newAge = 0
    @Previewable @State var newSex = ""
    @Previewable @State var newHeight = 0.00
    @Previewable @State var newCurrWeight = 0.00
    @Previewable @State var newGoalWeight = 0.00
    @Previewable @State var activityLevel = 0.00
    SettingsView(newName: $newName, newAge: $newAge, newSex: $newSex, newHeight: $newHeight, newCurrWeight: $newCurrWeight, newGoalWeight: $newGoalWeight, activityLevel: $activityLevel)
}
