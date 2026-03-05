//
//  Week4_LabApp.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

@main
struct Week4_LabApp: App {
    @StateObject private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appModel)
        }
    }
}
struct RootView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        Group {
            if appModel.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

