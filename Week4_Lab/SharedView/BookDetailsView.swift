//
//  BookDetailsView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct BookDetailsView: View {
    @EnvironmentObject var appModel: AppModel
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                        .frame(height: 180)
                    Image(systemName: book.systemImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)

                Text(book.title)
                    .font(.title.bold())
                Text(book.author)
                    .foregroundStyle(.secondary)

                HStack(spacing: 8) {
                    Image(systemName: "book")
                    Text("\(book.pages) pages")
                        .foregroundStyle(.secondary)
                }

                Button(action: { appModel.toggleSave(book) }) {
                    Text(appModel.isSaved(book) ? "Saved" : "Save")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 8)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.headline)
                    Text(book.synopsis)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)

                Spacer(minLength: 20)
            }
            .padding(.horizontal)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { BookDetailsView(book: .samples[0]) }
        .environmentObject(AppModel())
}
