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
                        ButtonView(text:"Login")
                    }.background(.black)
                        .cornerRadius(10)
                        .padding(8)
                    NavigationLink(destination: SignupView()){
                        ButtonView(text:"Signup")
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

struct ButtonView: View {
    let text: String
    var body: some View {
            Text(text)
                .background(.black)
                .tint(.white)
                .font(.custom("futura", size: 20))
                .padding(20)
                .frame(width: 200,height: 50)
        
        
    }
}
