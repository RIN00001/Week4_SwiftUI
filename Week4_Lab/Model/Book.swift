//
//  Book.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import Foundation
import SwiftUI
import Combine

struct Book: Identifiable, Equatable {
    let id: UUID
    let title: String
    let author: String
    let pages: Int
    let synopsis: String
    let systemImageName: String

    init(id: UUID = UUID(), title: String, author: String, pages: Int, synopsis: String, systemImageName: String = "book") {
        self.id = id
        self.title = title
        self.author = author
        self.pages = pages
        self.synopsis = synopsis
        self.systemImageName = systemImageName
    }
}
// Dummy data
extension Book {
    static let samples: [Book] = [

        Book(
            title: "The Swift Programming Language",
            author: "Apple",
            pages: 1000,
            synopsis: "The official guide to Swift. A must-read for iOS developers.",
            systemImageName: "swift"
        ),

        Book(
            title: "1984",
            author: "George Orwell",
            pages: 328,
            synopsis: "A dystopian social science fiction novel and cautionary tale.",
            systemImageName: "eye"
        ),

        Book(
            title: "To Kill a Mockingbird",
            author: "Harper Lee",
            pages: 281,
            synopsis: "A novel about racial injustice in the Deep South.",
            systemImageName: "bird"
        ),

        Book(
            title: "There's a Raccoon in the City",
            author: "Leon S. Kennedy",
            pages: 120,
            synopsis: "A mysterious creature begins appearing in the streets at night.",
            systemImageName: "pawprint"
        ),

        Book(
            title: "Notice Me",
            author: "F. Scott Fitzgerald",
            pages: 110,
            synopsis: "A story about recognition, ambition, and chasing dreams.",
            systemImageName: "bell"
        ),

        Book(
            title: "Beneath the Sun",
            author: "F. Scott Fitzgerald",
            pages: 280,
            synopsis: "A reflective tale about life under the weight of expectations.",
            systemImageName: "sun.max"
        ),

        Book(
            title: "The Hidden Algorithm",
            author: "Ada Lovelace",
            pages: 340,
            synopsis: "A thrilling exploration of the logic behind modern computing.",
            systemImageName: "cpu"
        ),

        Book(
            title: "Journey Through the Stars",
            author: "Carl Sagan",
            pages: 420,
            synopsis: "A cosmic journey explaining the mysteries of the universe.",
            systemImageName: "sparkles"
        ),

        Book(
            title: "The Lost Library",
            author: "Umberto Eco",
            pages: 300,
            synopsis: "A scholar uncovers a forgotten archive containing dangerous knowledge.",
            systemImageName: "books.vertical"
        ),

        Book(
            title: "The Final Chapter",
            author: "Agatha Christie",
            pages: 250,
            synopsis: "A detective story where every clue leads deeper into mystery.",
            systemImageName: "magnifyingglass"
        )
    ]
}

// App-wide state
@MainActor
final class AppModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var saved: [Book] = []
    @Published var allBooks: [Book] = Book.samples

    func toggleSave(_ book: Book) {
        if let idx = saved.firstIndex(of: book) {
            saved.remove(at: idx)
        } else {
            saved.insert(book, at: 0)
        }
    }

    func isSaved(_ book: Book) -> Bool {
        saved.contains(book)
    }

    func removeSaved(_ book: Book) {
        saved.removeAll { $0 == book }
    }
}

