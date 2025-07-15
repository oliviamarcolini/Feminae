//
//  MoodTracker.swift
//  Feminae
//
//  Created by Dhiraj Tiwari on 7/15/25.
//

import SwiftUI

struct MoodTrackerView: View {
    @State private var selectedMood: String = ""
    let moods = ["😊 Happy", "😐 Neutral", "😢 Sad"]

    var body: some View {
        VStack {
            Text("How are you feeling?")
                .font(.largeTitle)
                .padding()

            ForEach(moods, id: \.self) { mood in
                Button(action: {
                    selectedMood = mood
                    // Save the mood
                }) {
                    Text(mood)
                        .padding()
                        .background(selectedMood == mood ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            Text("Selected Mood: \(selectedMood)")
                .padding()
        }
        .padding()
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView()
    }
}

#Preview {
 
}
