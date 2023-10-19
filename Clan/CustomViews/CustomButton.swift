//
//  CustomButton.swift
//  Clan
//
//  Created by Mubeen Riaz on 03/10/2023.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var body: some View {
        Text(text)
            .background(.black)
            .tint(.white)
            .font(.custom("futura", size: 20))
            .padding(20)
            .frame(width: 200,height: 50)
    }
}

#Preview {
    CustomButton(text: "Button text")
}
