//
//  MainTabView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }

            SavedView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AppModel())
}
