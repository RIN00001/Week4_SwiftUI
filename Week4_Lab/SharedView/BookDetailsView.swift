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

            VStack(spacing: 24) {

                
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(.systemGray5))
                        .frame(width: 160, height: 220)

                    Image(systemName: book.systemImageName)
                        .font(.system(size: 60))
                        .foregroundStyle(.primary)
                }
                .padding(.top, 20)

                
                VStack(spacing: 6) {

                    Text(book.title)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)

                    Text(book.author)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 6) {
                        Image(systemName: "doc.text")
                            .font(.subheadline)

                        Text("\(book.pages) pages")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.secondary)

                }
                .multilineTextAlignment(.center)

                
                Button {
                    appModel.toggleSave(book)
                } label: {

                    HStack(spacing: 8) {

                        Image(systemName:
                                appModel.isSaved(book)
                                ? "bookmark.fill"
                                : "bookmark")

                        Text(appModel.isSaved(book) ? "Saved" : "Save")
                    }
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal)

                
                VStack(alignment: .leading, spacing: 8) {

                    Text("Synopsis")
                        .font(.headline)

                    Text(book.synopsis)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BookDetailsView(book: .samples[0])
            .environmentObject(AppModel())
    }
}
