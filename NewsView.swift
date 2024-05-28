//
//  NewsView.swift
//  Activovo
//
//  Created by Turma01-27 on 27/05/24.
//

import SwiftUI

struct NewsView: View {
    @State private var articles: [Article] = []
    @State private var selectedArticleURL: URL?
    @State private var isPresentingSafariView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(articles) { article in
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            if let url = URL(string: article.url) {
                                Button(action: {
                                    selectedArticleURL = url
                                    isPresentingSafariView = true
                                }) {
                                    Text("Leer más")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                        Divider() 
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Noticias")
        }
        .onAppear {
            NewsService().fetchNews { fetchedArticles in
                if let fetchedArticles = fetchedArticles {
                    self.articles = fetchedArticles
                }
            }
        }
        .sheet(isPresented: $isPresentingSafariView) {
            if let url = selectedArticleURL {
                SafariView(url: url)
            }
        }
    }
}

struct SafariView: View {
    let url: URL

    var body: some View {
        SafariViewController(url: url)
            .edgesIgnoringSafeArea(.all)
    }
}

import SafariServices
struct SafariViewController: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#Preview {
    NewsView()
}
