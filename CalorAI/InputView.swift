//
//  InputView.swift
//  CalorAI
//
//  Created by Gyu-Min Noh on 1/25/26.
//

import SwiftUI

struct InputView: View {
    @State var foodInput: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(red: 0.2, green: 0.3, blue: 0.6)
                    .ignoresSafeArea()
                VStack() {
                    // Text "Input Food(s)"
                    Text("Input Food(s) :)")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.top, 100)
                        .padding(.bottom, 50)
                    
                    // Input box
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $foodInput)
                            .frame(height: 200)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 15)
                        
                        if(foodInput.isEmpty) {
                            Text("Example: \nCorn Flakes 200g, \n2% milk 250ml\n...")
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, 27)
                                .padding(.vertical, 17)
                                .allowsHitTesting(false)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        // Input button
                        Button("Input") {
                            
                        }
                        .frame(width: 80, height: 20)
                        .cornerRadius(10)
                        .background(Color.gray)
                        .border(Color.black)
                        .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 15)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    InputView()
}
