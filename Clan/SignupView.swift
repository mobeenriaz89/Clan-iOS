//
//  SignupView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

//person.crop.circle.fill.badge.plus
//forward.end.circle.fill
//person.badge.key
//play.circle.fill

import SwiftUI

struct SignupView: View {
    @State private var text: String = ""

    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("appBg").resizable()
                    .ignoresSafeArea()
                
                VStack{
                    OnBoardIcon(img: "person.crop.circle.fill.badge.plus")
                    Spacer()
                    InputField(placeHolder: "Email").padding(8)
                    InputField(placeHolder: "Password").padding(8)
                    InputField(placeHolder: "Confirm Password").padding(8)
                    Spacer()
                    NavigationLink(destination: HomeView()){
                        Image(systemName: "forward.end.circle.fill")
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
    SignupView()
}

