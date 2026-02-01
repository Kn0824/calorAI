//
//  ContentView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/24/26.
//

import SwiftUI

struct ContentView: View {
    @State var foodInput: String = ""
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
    var body: some View {
        TabView {
            InputView()
                .tabItem {
                    Label("Log", systemImage: "plus.circle.fill")
                }
            DiaryView()
                .tabItem {
                    Label("Diary", systemImage: "book.fill")
                }
            ProfileView()
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
