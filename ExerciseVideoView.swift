//
//  ExerciseVideoView.swift
//  ActivoVo
//
//  Created by Turma01-23 on 27/05/24.
//

/*import SwiftUI
struct ExerciseVideoView: View {
    var body: some View {
        
        
        
        VStack{
            HStack{
                Text("Exercise Time")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Spacer()
            }
        }
        
    }
}*/





import SwiftUI

struct ExerciseVideoView: View {
    @State private var timerIsRunning = false
    @State private var elapsedTime: TimeInterval = 0.0
    let exerciseDescription: String
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
            VStack{
            
                HStack {
                    Spacer()
                    Text(timeString(time: elapsedTime))
                        .font(.title)
                        .onReceive(timer) { _ in
                            if self.timerIsRunning {
                                self.elapsedTime += 1
                            }
                        }
                    Text(exerciseDescription)
                        .font(.title)
                        .padding()
                    Spacer()
                }
                Image("veio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 2000, height: 200)
                    .padding()
                Spacer()
            }
        ScrollView {
            
            VStack(spacing: 16) {
                
                NavigationLink(destination: ExerciseVideoView(exerciseDescription: "Strenght training")) {
                    ExerciseCard(
                        title: "Strength training",
                        trainer: "Personal trainer",
                        type: "Workout video",
                        date: "Today",
                        icon: "dumbbell",
                        actionIcon: "play.circle"
                    )
                }
                NavigationLink(destination: ExerciseVideoView(exerciseDescription: "Bike")) {
                    
                    ExerciseCard(
                        title: "Bike",
                        trainer: "Personal trainer",
                        type: "Workout video",
                        date: "Today",
                        icon: "bicycle",
                        actionIcon: "play.circle"
                    )
                }
                NavigationLink(destination: ExerciseVideoView(exerciseDescription: "Cardio session")) {
                    
                    ExerciseCard(
                        title: "Cardio session",
                        trainer: "Fitness instructor",
                        type: "Exercise chat",
                        date: "Tomorrow",
                        icon: "heart.circle",
                        actionIcon: "play.circle"
                    )
                }
                NavigationLink(destination: ExerciseVideoView(exerciseDescription: "Stretching")) {
                    
                    ExerciseCard(
                        title: "Stretching",
                        trainer: "Fitness instructor",
                        type: "Exercise chat",
                        date: "Tomorrow",
                        icon: "figure.cooldown",
                        actionIcon: "play.circle"
                    )
                }
                NavigationLink(destination: ExerciseVideoView(exerciseDescription: "Run outside")) {
                    
                    ExerciseCard(
                        title: "Run outside",
                        trainer: "Fitness instructor",
                        type: "Stretching",
                        date: "Tomorrow",
                        icon: "figure.run",
                        actionIcon: "play.circle"
                    )
                }
            }
            .padding()
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                self.timerIsRunning.toggle()
            }) {
                Image(systemName: timerIsRunning ? "pause.circle.fill" : "play.circle.fill")
                    .font(.title)
            }
            )
            .padding()
        }
        
        func timeString(time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }

    struct ExerciseDetail_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseVideoView(exerciseDescription: "Exercício de alongamento")
        }
    }

#Preview {
    ExerciseVideoView(exerciseDescription: "Exercício de alongamento")
}
