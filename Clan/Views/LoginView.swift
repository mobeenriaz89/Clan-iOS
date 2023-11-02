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
    @State private var emailTxt: String = "mubeenriaz89@gmail.com"
    @State private var passTxt: String = "abc123"
    @State private var loginMsg: String = ""
    @State private var isLoading = false
    @State private var showAlert = false
    @State var bounceValue: Int = 0
    @State var showModal = false

    var body: some View {
        NavigationStack{
            ZStack{
                Image("appBg").resizable()
                    .ignoresSafeArea()
                
                VStack{
                    //OnBoardIcon(img: "person.badge.key")
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100,height: 100)
                        .foregroundStyle(.tint)
                        .tint(.black)
                        .symbolEffect(.variableColor, isActive: isLoading)
                    
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
                    
                    Spacer()
                        .alert(loginMsg, isPresented: $showAlert) {
                            Button("OK", role: .cancel) {
                            }
                        }
                    
                    Button {
                        if !emailTxt.isEmpty && !passTxt.isEmpty{
                            isLoading = true
                            //Autheticating user with Firebase Authentication
                            FirebaseAuthModel.login(email: emailTxt, password: passTxt) { isSuccess, msg in
                                isLoading = false
                                self.loginMsg = msg
                                
                                if isSuccess{
                                    AppDefaults.setLoggedIn(loggedIn: true)
                                    self.showModal = true
                                }else{
                                    showAlert = true
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .tint(.black)
                            .frame(width: 80, height: 80)
                            .symbolEffect(.disappear, isActive: isLoading)
                    }
                    
                }
                .padding()
                if isLoading {
                    
                    ProgressView()
                        .controlSize(.large)
                        .tint(.black)
                        .foregroundColor(.gray)
                        .scaleEffect(x:2, y: 2, anchor: .center)
                        .padding(20)
                    
                }
            }
            .fullScreenCover(isPresented: $showModal, content: {
                HomeView(isPresented: $showModal, msgTxt: "")
            })
        }
    }
    
    
}

#Preview {
    LoginView()
}

