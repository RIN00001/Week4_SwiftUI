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
        Book(title: "The Swift Programming Language", author: "Apple", pages: 1000, synopsis: "The official guide to Swift. A must‑read for iOS developers.", systemImageName: "swift"),
        Book(title: "1984", author: "George Orwell", pages: 328, synopsis: "A dystopian social science fiction novel and cautionary tale.", systemImageName: "eye"),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", pages: 281, synopsis: "A novel about the serious issues of rape and racial inequality.", systemImageName: "bird"),
        Book(title: "There's racoon in the city", author: "Leon S Kennedy", pages: 120, synopsis: "A critique of the American Dream set in the Jazz Age.", systemImageName: "book.closed"),
        Book(title: "Notice me", author: "F. Scott Fitzgerald", pages: 110, synopsis: "A critique of the American Dream set in the Jazz Age.", systemImageName: "book.closed"),
        Book(title: "Beneath the sun", author: "F. Scott Fitzgerald", pages: 280, synopsis: "A critique of the American Dream set in the Jazz Age.", systemImageName: "book.closed"),
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

