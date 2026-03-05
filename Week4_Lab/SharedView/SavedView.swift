//
//  SavedView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        NavigationStack {
            Group {
                if appModel.saved.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        Text("Your saved list is empty")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(appModel.saved) { book in
                            NavigationLink(destination: BookDetailsView(book: book)) {
                                Saved_BookCard(book: book, showDelete: true) {
                                    appModel.removeSaved(book)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet { appModel.removeSaved(appModel.saved[index]) }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Saved")
        }
    }
}

#Preview {
    SavedView()
        .environmentObject(AppModel())
}
