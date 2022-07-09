//
//  LaunchView.swift
//  iCrypto
//
//  Created by Майлс on 05.07.2022.
//

import SwiftUI

struct LaunchView: View {
    
    //MARK: - PROPERTIES
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        logoAndTitle
            .padding(.top, 50)
    }
}

//MARK: - EXTENSION
extension LaunchView {
    //VIEWS
    private var logoAndTitle: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 250, height: 250)
            Text("iCrypto")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .onAppear {
                    changeStatus()
                }
        }
    }
    
    //METHODS
    private func changeStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.linear) {
                showLaunchScreen = false
            }
        }
    }
}

//MARK: - PREVIEW
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchScreen: .constant(true))
    }
}
