//
//  ClanApp.swift
//  Clan
//
//  Created by Mubeen Riaz on 27/09/2023.
//

import SwiftUI
import Firebase
@main
struct ClanApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
