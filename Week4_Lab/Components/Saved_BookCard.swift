//
//  Saved_BookCard.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct Saved_BookCard: View {

    let book: Book
    var showDelete: Bool = false
    var onDelete: (() -> Void)? = nil

    var body: some View {

        HStack(spacing: 16) {

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(width: 56, height: 76)

                Image(systemName: book.systemImageName)
                    .font(.system(size: 20))
                    .foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(book.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if showDelete, let onDelete {

                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.red)
                        .frame(width: 36, height: 36)
                        .background(Color.red.opacity(0.15))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(14)
        .background(Color(.systemBackground))  
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Saved_BookCard(book: .samples[0], showDelete: true) {}
        .padding()
}
