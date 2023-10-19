//
//  OnBoardIcon.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI

struct OnBoardIcon: View {
    var img: String = "person"
    var body: some View {
        Image(systemName: img)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100)
            .foregroundStyle(.tint)
            .tint(.black)
    }
}

#Preview {
    OnBoardIcon()
}
