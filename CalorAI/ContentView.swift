//
//  ContentView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/24/26.
//

import SwiftUI

struct ContentView: View {
    @State var foodInput: String = ""
    @State var showSettings: Bool = false
    @State var name: String = "Kevin"
    @State var sex: String = "Male"
    @State var age: Int = 23
    @State var userHeight: Double = 187.0
    @State var userWeight: Double = 85.0
    @State var goalWeight: Double = 81.0
    @State var activityLevel: Double = 1.55 // Moderately Active
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.6, alpha: 1.0)
        
        // White icons when not selected
        appearance.stackedLayoutAppearance.normal.iconColor = .white.withAlphaComponent(0.3)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white.withAlphaComponent(0.3)]
        
        // Bright white when selected
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var userMacros: Macros {
        Macros.calculate(
            sex: sex,
            age: age,
            height: userHeight,
            weight: userWeight,
            goalWeight: goalWeight,
            activityLevel: activityLevel
        )
    }
    var body: some View {
        TabView {
            InputView()
                .tabItem {
                    Label("Log", systemImage: "plus.circle.fill")
                }
            DiaryView(
                maxCal: userMacros.calories,
                maxProtein: userMacros.protein,
                maxCarbs: userMacros.carbs,
                maxFat: userMacros.fat
            )
            .id(userMacros.calories)
                .tabItem {
                    Label("Diary", systemImage: "book.fill")
                }
            ProfileView(
                name: $name,
                sex: $sex,
                age: $age,
                userHeight: $userHeight,
                userWeight: $userWeight,
                goalWeight: $goalWeight,
                activityLevel: $activityLevel
            )
            
            .id(name)
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
