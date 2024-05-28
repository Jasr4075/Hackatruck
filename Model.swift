import Foundation

struct Article: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Exercicio: Identifiable, Codable {
    let id = UUID()
    let nome: String?
    let descricao: String?
    let repeticoes: Int?
    let series: Int?
    let video: String?
}

struct Actividad: Identifiable, Decodable {
    let id: String
    let nome: String
    let descricao: String
    let duracao: Int
    let distancia: Int
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case nome
        case descricao
        case duracao
        case distancia
    }
}

