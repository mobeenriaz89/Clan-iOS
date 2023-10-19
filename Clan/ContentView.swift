//
//  ContentView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("appBg")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                VStack {
                    OnBoardIcon()
                    Spacer()
                    
                    NavigationLink(destination: LoginView()){
                        CustomButton(text:"Login")
                    }.background(.black)
                        .cornerRadius(10)
                        .padding(8)
                    NavigationLink(destination: SignupView()){
                        CustomButton(text:"Signup")
                    }
                    .background(.black)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
