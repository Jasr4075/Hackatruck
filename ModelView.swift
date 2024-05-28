import Foundation

class NewsService {
    private let apiKey = "a5a5edd433a0429d88b5c6abed1728b0"
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=br"
    
    func fetchNews(completion: @escaping ([Article]?) -> Void) {
        guard let url = URL(string: "\(baseURL)&apiKey=\(apiKey)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let newsResponse = try? JSONDecoder().decode(NewsResponse.self, from: data)
            completion(newsResponse?.articles)
        }.resume()
    }
}

class ExerciseViewModel: ObservableObject {
    @Published var exercicios: [Exercicio] = []
    
    func fetchExercicios() {
        guard let url = URL(string: "http://127.0.0.1:1880/get-exercicios") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Exercicio].self, from: data)
                    DispatchQueue.main.async {
                        self.exercicios = decodedResponse
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("HTTP error: \(error)")
            }
        }.resume()
    }
}

class ActivitiesViewModel: ObservableObject {
    @Published var actividad: [Actividad] = []
    
    func fetchActividades() {
        guard let url = URL(string: "http://127.0.0.1:1880/get-actividades") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Actividad].self, from: data)
                    DispatchQueue.main.async {
                        self.actividad = decodedResponse
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("HTTP error: \(error)")
            }
        }.resume()
    }
}
