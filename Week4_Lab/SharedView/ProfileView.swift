//
//  ProfileView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 90, height: 90)

                        Image(systemName: "person")
                            .font(.system(size: 32))
                            .foregroundColor(.secondary)
                    }
                    Text("John Doe")
                        .font(.title3.bold())

                    Text("john.doe@example.com")
                        .foregroundStyle(.secondary)
                        .tint(.secondary)
                    
                    Text("Avid reader, tech enthusiast, and minimalist.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                }
                .padding(.top, 40)

                Spacer()

                Button {
                    appModel.isAuthenticated = false
                } label: {
                    Text("Sign Out")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.12))
                        .foregroundColor(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppModel())
}
