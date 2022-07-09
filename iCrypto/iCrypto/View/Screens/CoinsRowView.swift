//
//  CoinsRowView.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import SwiftUI

struct CoinsRowView: View {
    
    //MARK: - PROPERTIES
    @EnvironmentObject private var vm: CryptoVM
    @State private var showData: Bool = true
    
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            header
            SearchTemplate(text: $searchText)
            mainField
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { infoButton }
        }
    }
}

//MARK: - EXTENSION
extension CoinsRowView {
    //VIEWS
    private var header: some View {
        VStack {
            HStack {
                Text("Название")
                Spacer()
                HStack {
                    Text("Стоймость")
                    refreshButton
                }
            }
            .font(.caption)
            .padding(.horizontal, 25)
            Capsule()
                .frame(height: 1)
                .padding(.horizontal, 10)
                .opacity(0.75)
        }
    }
    private var coinsRow: some View {
        ScrollView {
            ForEach(vm.cryptoAndCurrency.filter({ (value: Currency) -> Bool in
                return value.name.lowercased().contains(searchText.lowercased()) || searchText == ""
            }), id: \.self) { value in
                CurrencyTemplate(currency: value)
            }
        }
    }
    private var mainField: some View {
        VStack {
            if showData {
                coinsRow
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .gesture(DragGesture().onChanged({ _ in UIApplication.shared.dismissKeyboard() }))
        .transition(AnyTransition.opacity)
    }

    //BUTTONS
    private var refreshButton: some View {
        Button(action: {
            withAnimation() {
                showData = false
                vm.getDataFromAPI()
            }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation() { showData = true }
                }
        }) {
            Image(systemName: "arrow.clockwise")
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
    private var infoButton: some View {
        NavigationLink(destination: {
            InfoView()
        }) {
            Image(systemName: "questionmark.circle")
                .foregroundColor(.primary)
                .font(.subheadline)
        }
    }
}

//MARK: - PREVIEW
struct CoinsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoinsRowView()
                .environmentObject(CryptoVM())
        }
    }
}
