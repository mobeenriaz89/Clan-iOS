//
//  InputField.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct InputField: View {
    @State var placeHolder: String = "Placeholder"
    @State var text: String = ""
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .textFieldStyle(.roundedBorder)
            .tint(.white)
            .font(.custom("futura", size: 20))
    }
}

#Preview {
    InputField()
}
