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

        HStack(spacing: 16) {

            // Icon box
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemGray6))
                    .frame(width: 62, height: 82)

                Image(systemName: book.systemImageName)
                    .font(.system(size: 25))
                    .foregroundStyle(.secondary)
            }

            // Title + Author
            VStack(alignment: .leading, spacing: 4) {

                Text(book.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // Chevron arrow
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.tertiary)

        }
        .padding(.vertical, 10)
    }
}

#Preview {
    Explore_BookCard(book: .samples[0])
        .padding()
}
