//
//  InfoView.swift
//  iCrypto
//
//  Created by Майлс on 04.07.2022.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    //MARK: - BODY
    var body: some View {
        List {
            Section(header: Text("О приложении")) {
                header
                aboutApp
            }
            Section(header: Text("Обо мне")) {
                myGit
            }
            copyrights
        }
        .listStyle(PlainListStyle())
        .padding([.horizontal, .top])
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Доп информация")
        .toolbar { ToolbarItem(placement: .navigationBarLeading) { backButton } }
    }
}

//MARK: - EXTENSION
extension InfoView {
    //BUTTONS
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
                .font(.subheadline)
        }
    }

    //VIEWS
    private var header: some View {
        HStack {
            Image("infoLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Link(destination: URL(string: "https://bitpay.com")!) {
                Text("Посетите сайт bitpay.com для дополнительной информации!")
                    .foregroundColor(.blue)
            }
        }
    }
    private var aboutApp: some View {
            Text("Приветствую в приложении iCrypto! Данное приложение предназначено, для отслеживания стоймости биткоина в разных валютах.\n\nПроект написан полностью на языке Swift и использует такие фреймворки как: SwiftUI и Combine. Так же используется архитектура MVVM.\n\nПроект является учебным в рамках практической работы в институте МТУСИ.")
    }
    private var myGit: some View {
        VStack {
            HStack {
                Image("git")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Link(destination: URL(string: "https://github.com/MilezKilo?tab=repositories")!) {
                    Text("Посетите мой гит аккаунт!")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    private var copyrights: some View {
        Text("This code cannot be used without permission. All right's reserved.©")
            .font(.caption)
            .padding()
    }
}

//MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoView()
        }
    }
}
