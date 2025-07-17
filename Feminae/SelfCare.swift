//
//  SelfCare.swift
//  Feminae
//
//  Created by Gargi Tiwari on 7/15/25.
//

import SwiftUI

import SwiftUI

// 1. Define your pastel theme
extension Color {
    static let lavender = Color(red: 0.90, green: 0.88, blue: 0.97)
    static let babyBlue = Color(red: 0.68, green: 0.85, blue: 0.90)
    static let babyPink = Color(red: 0.98, green: 0.83, blue: 0.89)
    
    struct Theme {
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: [.lavender, .babyBlue, .babyPink]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
        let cardBg = Color.white.opacity(0.8)
        let accent = Color.babyPink
    }
    static let theme = Theme()
}

// 2. Tip model with destination
struct Tip: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let destination: AnyView
}

// 3. TipCard
struct TipCard: View {
    let tip: Tip
    var body: some View {
        HStack {
            Image(systemName: tip.icon)
                .font(.largeTitle)
                .foregroundColor(.theme.accent)
                .padding()
            Text(tip.title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.theme.cardBg)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

// 4. Detail Views
struct MeditationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("🧘‍♀️ Meditation Steps")
                    .font(.largeTitle.bold())
                ForEach([
                    "Find a quiet spot",
                    "Sit comfortably",
                    "Close eyes, focus on breath",
                    "Breathe in 4s, hold 2s, out 6s",
                    "Gently return if mind wanders"
                ], id: \.self) { step in
                    Text("• \(step)")
                }
            }
            .padding()
        }
        .navigationTitle("Meditation")
    }
}

struct JournalingView: View {
    let prompts = [
        "What are you grateful for today?",
        "What made you smile recently?",
        "What is one goal this week?",
        "How can you be kinder to yourself?",
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📓 Journaling Prompts")
                    .font(.largeTitle.bold())
                ForEach(prompts, id: \.self) { p in
                    Text("• \(p)")
                }
            }
            .padding()
        }
        .navigationTitle("Journaling")
    }
}

struct StretchView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("🤸 Stretching Poses")
                    .font(.largeTitle.bold())
                Image(systemName: "figure.stand")
                Text("Standing Side Stretch")
                Image(systemName: "figure.head.line.dotted.figure.stand")
                Text("Neck Roll")
                Image(systemName: "figure.walk")
                Text("Leg & Calf Stretch")
            }
            .padding()
        }
        .navigationTitle("Stretching")
    }
}

struct HydrationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("💧 Benefits of Hydration")
                    .font(.largeTitle.bold())
                ForEach([
                    "Boosts energy",
                    "Improves skin health",
                    "Supports digestion",
                    "Enhances mood & focus"
                ], id: \.self) { b in
                    Text("• \(b)")
                }
            }
            .padding()
        }
        .navigationTitle("Hydration")
    }
}

// 5. Main SelfCareSection with navigation
struct SelfCareSection: View {
    let tips: [Tip] = [
        Tip(title: "Morning Meditation", icon: "sun.max.fill",
            destination: AnyView(MeditationView())),
        Tip(title: "Evening Journaling", icon: "book.fill",
            destination: AnyView(JournalingView())),
        Tip(title: "Short Stretch Break", icon: "figure.walk",
            destination: AnyView(StretchView())),
        Tip(title: "Stay Hydrated", icon: "drop.fill",
            destination: AnyView(HydrationView()))
    ]
    
    var body: some View {
            ZStack {
                Color.theme.bgGradient.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 16) {
                    Text("🌸 Self‑Care for You")
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(tips) { tip in
                                NavigationLink(destination: tip.destination) {
                                    TipCard(tip: tip)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top, 40)
            }
    }
}

struct SelfCareSection_Previews: PreviewProvider {
    static var previews: some View {
        SelfCareSection()
    }
}

