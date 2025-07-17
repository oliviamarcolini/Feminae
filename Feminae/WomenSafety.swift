//
//  WomenSafety.swift
//  Feminae
//
//  Created by Dhiraj Tiwari on 7/15/25.
//

import SwiftUI

struct SafetyPage: View {
    @State private var emergencyContacts: [String] = [
        "Brazilian Police - Dial 190",
        "US Emergency telephone number - Dial 911",
        "Hong Kong emergency number - Dial 999"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                               startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Women's Safety Page")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("Emergency Contacts:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    List(emergencyContacts, id: \.self) { contact in
                        Text(contact)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button(action: {
                        
                    }) {
                        
                    }
                    .padding()
                }
                .navigationBarTitle("Safety", displayMode: .inline)
                
                
            }
        }
    }
}
