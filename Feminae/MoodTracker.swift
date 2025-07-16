//
//  MoodTracker.swift
//  Feminae
//
//  Created by Gargi Tiwari on 7/15/25.
//

import SwiftUI

import SwiftUI

// 1. Define pastel theme


// 2. Mood option data model
struct MoodOption: Identifiable {
    let id = UUID()
    let mood: String
    let icon: String
    let isSad: Bool
}

// 3. Mood card UI
struct MoodCard: View {
    let option: MoodOption
    var body: some View {
        VStack {
            Image(systemName: option.icon)
                .font(.system(size: 40))
                .padding(.top)
                .foregroundColor(.theme.accent)
            Text(option.mood)
                .font(.headline)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color.theme.cardBg)
        .cornerRadius(12)
        .shadow(radius: 2)
        .padding(6)
    }
}

// 4. Detail feedback view
struct MoodDetailView: View {
    let option: MoodOption
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(option.isSad ? "Feeling Blue?" : "You're Radiant 🎉")
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
                
                if option.isSad {
                    Text("Here are some gentle ideas to help lift your mood:")
                        .font(.headline)
                    Group {
                        Text("• Try a short meditation or breathing exercise")
                        Text("• Write a gratitude note or doodle how you feel")
                        Text("• Stretch or take a walk for gentle movement")
                        Text("• Listen to calming music or dance to a favorite song")
                    }
                    .padding(.leading)
                    .font(.body)
                } else {
                    Text("""
                        That’s wonderful news! Keep it up — what made you feel this way? Jot it down or enjoy that feeling more!
                        """)
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(option.mood)
    }
}

// 5. Mood tracker main section
struct MoodTrackerSection: View {
    let moods: [MoodOption] = [
        MoodOption(mood: "Sad", icon: "face.dashed", isSad: true),
        MoodOption(mood: "Anxious", icon: "exclamationmark.circle", isSad: true),
        MoodOption(mood: "Okay", icon: "face.neutral", isSad: false),
        MoodOption(mood: "Happy", icon: "smiley", isSad: false),
        MoodOption(mood: "Great", icon: "star.circle", isSad: false)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.bgGradient.ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("😊 How are you feeling today?")
                        .font(.largeTitle.bold())
                        .padding(.top, 40)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                        ForEach(moods) { opt in
                            NavigationLink(destination: MoodDetailView(option: opt)) {
                                MoodCard(option: opt)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Preview
struct MoodTrackerSection_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerSection()
    }
}
