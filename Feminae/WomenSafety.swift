//
//  WomenSafety.swift
//  Feminae
//
//  Created by Dhiraj Tiwari on 7/15/25.
//

import SwiftUI

struct WomenSafety: View {
    @State private var emergencyContacts: [String] = [
        "🇧🇷 Brazilian Police - Dial 190",
        "🇺🇸 USA Emergency telephone number - Dial 911",
        "🇭🇰 Hong Kong emergency number - Dial 999"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.bgGradient.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Women's Safety ‧₊♀˚.")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("Emergency Contacts:")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                                            
                    List(emergencyContacts, id: \.self) { contact in
                        Text(contact)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(PlainListStyle())
                    
                    Button(action: {
                        
                    }) {
                        
                    }
                    
                }
                .padding(.all, 25.0)
            }
        }
        
    }
}

#Preview {
    WomenSafety()
}

