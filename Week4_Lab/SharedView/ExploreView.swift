//
//  ExploreView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var appModel: AppModel
    @State private var query: String = ""

    var filtered: [Book] {
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return appModel.allBooks
        }

        return appModel.allBooks.filter { book in
            book.title.localizedCaseInsensitiveContains(query) ||
            book.author.localizedCaseInsensitiveContains(query)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filtered) { book in
                    NavigationLink(destination: BookDetailsView(book: book)) {
                        Explore_BookCard(book: book)
                            .padding(.vertical, 6)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.horizontal)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("Explore")
            .searchable(
                text: $query,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search titles or authors"
            )
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(AppModel())
}
