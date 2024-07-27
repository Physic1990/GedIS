//
//  HeaderView.swift
//  Touris
//
//  Created by Arushi Goyal on 7/26/24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @State private var isProfileViewPresented = false

    var body: some View {
        HStack {
            Text("Touris")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer() // Push the profile button to the right
            Button(action: {
                isProfileViewPresented.toggle()
            }) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .padding()
            }
        }
        .background(Color.white) // Set a background color for the header
        .shadow(radius: 2) // Add a shadow for a slight elevation effect
        .sheet(isPresented: $isProfileViewPresented) {
            ProfileView()
        }
    }
}

