import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                    Spacer()
                    Image(systemName: "dumbbell")
                        .resizable()
                        .frame(width: 40, height: 24)
                        .padding()
                }
                
                Text("Olá, ActivoVo!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    VStack {
                        NavigationLink(destination: ExerciseView()) {
                            InfoCard(number: "2", label: "Próximos exercícios")
                        }
                        NavigationLink(destination: ActivitiesView()) {
                            InfoCard(number: "3", label: "Novas atividades")
                        }
                    }
                    VStack {
                        NavigationLink(destination: RemindersView()) {
                            InfoCard(number: "6", label: "Lembretes pendentes")
                        }
                        NavigationLink(destination: NewsView()) {
                            InfoCard(number: "+99", label: "Notícias de esportes")
                        }
                    }
                }
                .padding()
                
                Text("As atividades de hoje")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment:.leading)
                Spacer()
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
            .navigationBarHidden(true)
        }
    }
}

struct InfoCard: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack {
            Text(number)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(label)
                .font(.subheadline)
        }
        .frame(width: 150, height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ActivityCard: View {
    let title: String
    let time: String
    let type: String
    let icon: String
    let category: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(type)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                
                Text(title)
                    .font(.headline)
                Text(time)
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Image(systemName: icon)
                    .frame(width: 24, height: 24)
                Text(category)
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "bell")
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding([.leading, .trailing, .top])
    }
}

#Preview {
    ContentView()
}
