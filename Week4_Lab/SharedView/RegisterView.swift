//
//  RegisterView.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appModel: AppModel
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Image(systemName: "book.pages")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.black)

                    Text("BookApp")
                        .font(.title.bold())
                }
                .padding(.top, 80)

                VStack(spacing: 12) {
                    TextField("Full Name", text: $fullName)
                        .textContentType(.name)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    SecureField("Password", text: $password)
                        .textContentType(.newPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)

                Button(action: { appModel.isAuthenticated = true }) {
                    Text("Register")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)

                Spacer()

                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundStyle(.secondary)
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.bottom, 24)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(AppModel())
}
