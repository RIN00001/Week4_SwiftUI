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
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(width: 56, height: 56)
                Image(systemName: book.systemImageName)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title).font(.subheadline).lineLimit(1)
                Text(book.author).foregroundStyle(.secondary).font(.caption)
            }
            Spacer()
            if showDelete, let onDelete {
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                        .padding(8)
                        .background(Color(.systemRed).opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Saved_BookCard(book: .samples[0], showDelete: true) {}
        .padding()
}
