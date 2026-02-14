//
//  ProfileView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct ProfileView: View {
    @State var showSettings: Bool = false
    @Binding var name: String
    @Binding var sex: String
    @Binding var age: Int
    @Binding var userHeight: Double
    @Binding var userWeight: Double
    @Binding var goalWeight: Double
    @Binding var activityLevel: Double
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(red: 0.2, green: 0.3, blue: 0.6)
                    .ignoresSafeArea()
                
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            // Profile info
                            Text("Name: \(name)")
                            Text("Age: \(String(age))")
                            Text("Sex: \(sex)")
                            Text("Height: \(String(userHeight))cm")
                            Text("Current Weight: \(String(userWeight))kg")
                            Text("Goal Weight: \(String(goalWeight))kg")
                            Text("Activity Level: \(activityLevelText())")
                        }
                        .foregroundColor(.white)
                        .font(.title3)
                        
                        Spacer()
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .frame(width: 100, height: 100)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 25))
                            .padding(5)
                    }
                    .padding(10)
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing)
                        .sheet(isPresented: $showSettings) {
                            SettingsView(newName: $name, newAge: $age, newSex: $sex, newHeight: $userHeight, newCurrWeight: $userWeight, newGoalWeight: $goalWeight, activityLevel: $activityLevel)
                        }
                    }
                }
            }
        }
    }
    func activityLevelText() -> String {
        switch activityLevel {
        case 1.2: return "Sedentary"
        case 1.375: return "Light"
        case 1.55: return "Moderate"
        case 1.725: return "Very"
        case 1.9: return "Extreme"
        default: return "Unknown"
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
    ProfileView(name: $newName, sex: $newSex, age: $newAge, userHeight: $newHeight, userWeight: $newCurrWeight, goalWeight: $newGoalWeight, activityLevel: $activityLevel)
}
