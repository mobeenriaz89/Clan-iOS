//
//  InputField.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct InputField: View {
    @State var placeHolder: String = ""
    @State var text: String = ""
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .tint(.white)
            .font(.custom("futura", size: 20))
            .textCase(.lowercase)
    }
}

#Preview {
    InputField(placeHolder: "", text: "")
}
