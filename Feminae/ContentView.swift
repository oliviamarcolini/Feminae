//
//  ContentView.swift
//  Feminae
//
//  Created by Olivia Monteiro on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.bgGradient.ignoresSafeArea()
                VStack (alignment: .leading, spacing: 20){
                    
                    Spacer()
                    
                    Text("Welcome to Feminae")
                        .fontWeight(.bold)
                        .foregroundColor(Color.purple)
                        .font(.system(size:32))
                    
                    Text("An app for women made by women ‎ . ݁⋆ ۶ৎ ݁˖ . ݁")
                        .italic()
                        .foregroundColor(Color.purple.opacity(0.7))
                        .font(.system(size:25))
                    
                    Spacer()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing:20), count: 2), spacing: 20) {
                        NavigationLink(destination: ToDoList()) {
                            HomeButton(icon: "checkmark.circle", label: "To-Do")
                        }
                        
                        NavigationLink(destination: SelfCareSection()) {
                            HomeButton(icon: "bubbles.and.sparkles", label: "Self-Care")
                        }
                        
                        NavigationLink(destination: MoodTrackerSection()) {
                            HomeButton(icon: "face.smiling", label: "Mood-Tracker")
                    }
                        NavigationLink(destination: SafetyPage()) {
                            HomeButton(icon: "exclamationmark.triangle", label: "Women-Safety")
                        }

                    }//LazyVGrid
                    
                    Spacer()
                    
                }//VStack
                .padding(.all, 25.0)
                .padding()
                
            }//ZStack
        }//NavigationStack
        
    }//body
}//ContentView

struct HomeButton: View {
    var icon: String
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .foregroundColor(.babyPink)
            
            Text(label)
                .font(.footnote)
                .foregroundColor(.gray)
                .bold()
                .padding(.top, 7.0)
            
        }//VStack
        .frame(width: 120, height: 120)
        .background(Color(.white.opacity(0.8)))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
    }//body
}//HomeButton


#Preview {
    ContentView()
}
