//
//  Main.swift
//  iCrypto
//
//  Created by Майлс on 30.06.2022.
//

import SwiftUI

struct Main: View {
    
    //MARK: - PROPERTIES
    @EnvironmentObject private var vm: CryptoVM
    
    var body: some View {
        CoinsRowView().navigationTitle("iCrypto")
    }
}

//MARK: - PREVIEW
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Main()
                .environmentObject(CryptoVM())
        }
    }
}
