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
    @Binding var newAge: String
    @Binding var newHeight: String
    @Binding var newCurrWeight: String
    @Binding var newGoalWeight: String
    var body: some View {
        ZStack {
            // Background
            Color(red: 0.2, green: 0.3, blue: 0.6)
                .ignoresSafeArea()
            VStack {
                Text("Settings")
                    .font(.title)
                HStack {
                    Text("Change Name: ")
                    TextField("", text: $newName)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                }
                .padding()
                HStack {
                    Text("Change Age: ")
                    TextField("", text: $newAge)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                }
                .padding()
                HStack {
                    Text("Change Height: ")
                    TextField("", text: $newHeight)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                }
                .padding()
                HStack {
                    Text("Change Current Weight: ")
                    TextField("", text: $newCurrWeight)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                }
                .padding()
                HStack {
                    Text("Change Goal Weight: ")
                    TextField("", text: $newGoalWeight)
                        .textFieldStyle(.roundedBorder)
                        .border(.black)
                }
                .padding()
                HStack {
                    Spacer()
                    Button("Save Changes") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    .font(.subheadline)
                    .padding()
                    .foregroundStyle(.white)
                }
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    @Previewable @State var newName = ""
    @Previewable @State var newAge = ""
    @Previewable @State var newHeight = ""
    @Previewable @State var newCurrWeight = ""
    @Previewable @State var newGoalWeight = ""
    SettingsView(newName: $newName, newAge: $newAge, newHeight: $newHeight, newCurrWeight: $newCurrWeight, newGoalWeight: $newGoalWeight)
}
