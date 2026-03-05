//
//  Explore_BookCard.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct Explore_BookCard: View {
    let book: Book

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(width: 44, height: 44)
                Image(systemName: book.systemImageName)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title).font(.subheadline)
                Text(book.author).foregroundStyle(.secondary).font(.caption)
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    Explore_BookCard(book: .samples[0])
        .padding()
}
