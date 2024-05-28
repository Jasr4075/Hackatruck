import SwiftUI

struct ExerciceDetailView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Add new exercises")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 16) {
                        ExerciseCard(
                            title: "Strength training",
                            trainer: "Personal trainer",
                            type: "Workout video",
                            date: "Add",
                            icon: "dumbbell",
                            actionIcon: "play.circle"
                        )
                        ExerciseCard(
                            title: "Bike",
                            trainer: "Personal trainer",
                            type: "Workout video",
                            date: "Add",
                            icon: "bicycle",
                            actionIcon: "play.circle"
                        )
                        ExerciseCard(
                            title: "Cardio session",
                            trainer: "Fitness instructor",
                            type: "Exercise chat",
                            date: "Add",
                            icon: "heart.circle",
                            actionIcon: "play.circle"
                        )
                        ExerciseCard(
                            title: "Stretching",
                            trainer: "Fitness instructor",
                            type: "Exercise chat",
                            date: "Add",
                            icon: "figure.cooldown",
                            actionIcon: "play.circle"
                        )
                        ExerciseCard(
                            title: "Run outside",
                            trainer: "Fitness instructor",
                            type: "Stretching",
                            date: "Add",
                            icon: "figure.run",
                            actionIcon: "play.circle"
                        )
                    }
                    .padding()
                }
            }
        }
    }
}
#Preview {
    ExerciceDetailView()
}
