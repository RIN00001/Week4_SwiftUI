//
//  YourLibrary_BookCard.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct YourLibrary_BookCard: View {

    let book: Book

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray5))
                    .frame(width: 120, height: 150)

                Image(systemName: book.systemImageName)
                    .font(.system(size: 36))
                    .foregroundStyle(.primary)
            }

            Text(book.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .truncationMode(.tail)

            Text(book.author)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(width: 120)
    }
}

#Preview {
    YourLibrary_BookCard(book: Book.samples[0])
}
