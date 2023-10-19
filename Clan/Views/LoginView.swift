//
//  LoginView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

//person.crop.circle.fill.badge.plus
//forward.end.circle.fill
//person.badge.key
//play.circle.fill

import SwiftUI

struct LoginView: View {
    @State private var text: String = ""
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("appBg").resizable()
                    .ignoresSafeArea()
                VStack{
                    OnBoardIcon(img: "person.badge.key")
                    Spacer()
                    InputField(placeHolder: "Email").padding(8)
                    InputField(placeHolder: "Password").padding(8)
                    Spacer()
                    NavigationLink(destination: HomeView()){
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .tint(.black)
                            .frame(width: 80, height: 80)
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}

