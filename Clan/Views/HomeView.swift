//
//  HomeUIView.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isPresented: Bool
    
    @State var msgTxt: String
    
    @ObservedObject var chatManager = ChatManager()
        
    var body: some View {
        ZStack{
            Image("appBg").resizable()
                .ignoresSafeArea()
            VStack{
                Button(action: {
                    isPresented = false
                }, label: {
                    CustomButton(text: "Logout")
                        .background(.black)
                        .cornerRadius(10)
                        .padding(8)
                })
                
                List(chatManager.msgsList) { msg in
                    Text(msg.body ?? "")
                        .background(.clear)
                }.scrollContentBackground(.hidden)
                HStack{
                    TextField("Enter message here", text: $msgTxt)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .tint(.white)
                        .font(.custom("futura", size: 20))
                    Button(action: {
                        FirebaseFirestoreModel.sharedInstance.sendMesssage(msgBody: msgTxt) { isSuccess, msg in
                            print("Is message sent:\(isSuccess), Response message: \(msg)")
                            msgTxt = ""
                            //msgsList.append(msgTxt)
                        }
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .tint(.black)
                    })
                }
                .padding().clipShape(Rectangle())
            }
            
        }
        .onAppear{
            chatManager.getMsgsList()
        }
    }
}

#Preview {
    HomeView(isPresented: .constant(true), msgTxt: "")
}
