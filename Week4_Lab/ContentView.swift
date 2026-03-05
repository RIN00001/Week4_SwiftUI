//
//  ContentView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        if appModel.isAuthenticated {
            MainTabView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppModel())
}
