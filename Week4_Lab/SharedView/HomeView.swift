//
//  HomeView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    VStack(alignment: .leading, spacing: 4) {

                        Text("Welcome back, User")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("Your Library")
                            .font(.largeTitle.bold())

                    }
                    .padding(.top)

                    if appModel.saved.isEmpty {

                        Spacer()

                        VStack(spacing: 16) {

                            Image(systemName: "bookmark.slash")
                                .font(.system(size: 50))
                                .foregroundStyle(.secondary)

                            Text("No books saved yet.")
                                .font(.headline)

                            NavigationLink(destination: ExploreView()) {
                                Text("Discover Books")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 10)
                                    .background(Color(.systemGray5))
                                    .clipShape(Capsule())
                            }
                        }
                        .frame(maxWidth: .infinity)

                        Spacer()

                    } else {

                        HStack {
                            Text("Recently Saved")
                                .font(.title3.bold())

                            Spacer()

                            Text("\(appModel.saved.count) Books")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top)

                        VStack(alignment: .leading, spacing: 16) {

                            ScrollView(.horizontal, showsIndicators: false) {

                                HStack(spacing: 16) {

                                    ForEach(appModel.saved.prefix(3)) { book in
                                        NavigationLink(destination: BookDetailsView(book: book)) {
                                            YourLibrary_BookCard(book: book)
                                        }
                                        .buttonStyle(.plain) // prevents blue text
                                    }

                                }
                                .padding(.vertical, 4)
                            }

                            NavigationLink(destination: SavedView()) {
                                Text("View All Saved")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(.systemGray5))
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppModel())
}
