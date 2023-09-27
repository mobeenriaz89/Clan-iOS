//
//  HomeUIView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Image("appBg").resizable()
                .ignoresSafeArea()
            Text("Home")
        }
    }
}

#Preview {
    HomeView()
}
