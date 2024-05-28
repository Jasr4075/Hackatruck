import SwiftUI

struct ActivitiesView: View {
    @ObservedObject private var ModelView = ActivitiesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
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
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(ModelView.actividad) { actividad in
                            ActividadRow(actividad: actividad)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .background(Color(UIColor.systemGray5))
            .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            ModelView.fetchActividades()
        }
    }
}

struct ActividadRow: View {
    @State var actividad: Actividad
    @State private var isChecked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(actividad.nome)
                    .font(.body)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked ? .green : .black)
                }
            }
            if !actividad.descricao.isEmpty {
                Text(actividad.descricao)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    ActivitiesView()
}
