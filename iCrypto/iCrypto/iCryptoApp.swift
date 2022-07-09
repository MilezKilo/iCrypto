//
//  iCryptoApp.swift
//  iCrypto
//
//  Created by Майлс on 30.06.2022.
//

import SwiftUI

@main
struct iCryptoApp: App {
    
    @StateObject private var vm: CryptoVM = CryptoVM()
    @State private var showLaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    if !showLaunchScreen {
                        Main()
                    }
                }
                .environmentObject(vm)
                
                if showLaunchScreen {
                    LaunchView(showLaunchScreen: $showLaunchScreen)
                        .transition(AnyTransition.scale.animation(.easeInOut))
                }
            }
        }
    }
}
