import SwiftUI

struct ExerciseView: View {
    @StateObject private var viewModel = ExerciseViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("Pending exercises")
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
                        ForEach(viewModel.exercicios) { exercicio in
                            NavigationLink(destination: ExerciseVideoView(exerciseDescription: exercicio.descricao ?? "")) {
                                ExerciseCard(
                                    title: exercicio.nome ?? "",
                                    trainer: exercicio.descricao ?? "",
                                    type: exercicio.video ?? "",
                                    date: "Today",
                                    icon: "dumbbell",
                                    actionIcon: "play.circle"
                                )
                            }
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: ExerciceDetailView()) {
                    Text("Add new exercise")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.fetchExercicios()
        }
    }
}

import SwiftUI

struct ExerciseCard: View {
    let title: String
    let trainer: String
    let type: String
    let date: String
    let icon: String
    let actionIcon: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.black)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                Text(trainer)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "play.circle")
                        .foregroundColor(.gray)
                    Text(type)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            VStack {
                Text(date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                Spacer()
                Image(systemName: actionIcon)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


#Preview {
    ExerciseView()
}
