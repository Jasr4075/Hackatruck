import SwiftUI

struct RemindersView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Welcome to ActivoVo!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                .padding(.top)
                
                Text("Today's Achievements")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.bottom, 10)
                
            VStack(alignment: .leading, spacing: 15) {
                    RemindersRow(text: "Tomar café da manhã", isChecked: true)
                    RemindersRow(text: "Tomar remédios", isChecked: false)
                    RemindersRow(text: "Ir ao mercado fazer compra", isChecked: false)
                    RemindersRow(text: "Tomar banho", isChecked: false)
                    RemindersRow(text: "Escovar os dentes", isChecked: false)
                    RemindersRow(text: "Começar as atividades", isChecked: false)
                }
                
                .padding()
                .background(Color(UIColor.white))
                .cornerRadius(15)
                .padding(.horizontal)

                Spacer()
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    Spacer()
                    NavigationLink(destination: RemindersView()) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                    Spacer()
                    NavigationLink(destination: ExerciseView()) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            }
            .background(Color(UIColor.systemGray6))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct RemindersRow: View {
    let text: String
    let isChecked: Bool
    
    var body: some View {
        HStack {
            Text(text)
                .font(.body)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isChecked ? .green : .black)
        }
    }
}

#Preview {
ContentView()
}
