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
    @State private var emailTxt: String = ""
    @State private var passTxt: String = ""
    @State private var errorMsg: String = ""
    
    @State private var showAlert = false

    var body: some View {
            ZStack{
                Image("appBg").resizable()
                    .ignoresSafeArea()
                VStack{
                    OnBoardIcon(img: "person.badge.key")
                    Spacer()
                    
                    TextField("Email", text: $emailTxt)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .tint(.white)
                        .font(.custom("futura", size: 20))
                        .textCase(.lowercase)
                    
                    TextField("Password", text: $passTxt)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .tint(.white)
                        .font(.custom("futura", size: 20))
                        .textCase(.lowercase)
                    
//                    let tfEmail = InputField(placeHolder: "Email",text: $emailTxt)
//                    tfEmail.padding(8)
//                    let tfPassword = InputField(placeHolder: "Password",text: $passTxt)
//                    tfPassword.padding(8)
                    Spacer()
                        .alert(errorMsg, isPresented: $showAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                    Button {
                        if !emailTxt.isEmpty && !passTxt.isEmpty{
                            //Autheticating user with Firebase Authentication
                            FirebaseAuthModel.login(email: emailTxt, password: passTxt) { isSuccess, msg in
                                if !isSuccess{
                                    self.errorMsg = msg
                                    showAlert = true
                                }else{
                                    AppDefaults.setLoggedIn(loggedIn: true)
                                    self.errorMsg = msg
                                    showAlert = true
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

