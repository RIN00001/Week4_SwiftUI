//
//  ProfileDesc.swift
//  Week4_Lab
//
//  Created by student on 05/03/26.
//
//  Profile Details can just be hard coded
import SwiftUI

struct ProfileDesc: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.secondary)
            Text("John Doe").font(.title3.bold())
            Text("john.doe@example.com").foregroundStyle(.secondary)
            Text("Avid reader, tech enthusiast, and minimalist.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileDesc()
}
