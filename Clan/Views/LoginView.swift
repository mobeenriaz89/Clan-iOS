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
import FirebaseAuth

struct LoginView: View {
    @State private var text: String = ""
    
    
    var body: some View {
            ZStack{
                Image("appBg").resizable()
                    .ignoresSafeArea()
                VStack{
                    OnBoardIcon(img: "person.badge.key")
                    Spacer()
                    let tfEmail = InputField(placeHolder: "Email")
                    tfEmail.padding(8)
                    let tfPassword = InputField(placeHolder: "Password")
                    tfPassword.padding(8)
                    Spacer()
                    Button {
                        let email = tfEmail.text
                        let password = tfPassword.text
                        if !email.isEmpty && !password.isEmpty{
                            //Autheticating user with Firebase Authentication
                            FirebaseAuthModel.login(email: email, password: password) { isSuccess, msg in
                                if !isSuccess{
                                    Alert(title: Text("Error"),message: Text(msg))
                                }else{
                                    AppDefaults.setLoggedIn(loggedIn: true)
                                }
                            }
                        }
                    } label: {
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

#Preview {
    LoginView()
}

