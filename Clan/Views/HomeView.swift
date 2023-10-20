//
//  HomeUIView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct HomeView: View {

    @Binding var isPresented: Bool

    var body: some View {
        ZStack{
            Image("appBg").resizable()
                .ignoresSafeArea()
            VStack{
                Text("Home")
                
                
                Button(action: {
                    isPresented = false
                }, label: {
                    CustomButton(text: "Logout")
                        .background(.black)
                        .cornerRadius(10)
                        .padding(8)
                })
            }
                
        }
    }
}

