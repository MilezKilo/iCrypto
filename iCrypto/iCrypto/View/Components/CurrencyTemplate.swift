//
//  CurrencyTemplate.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import SwiftUI

struct CurrencyTemplate: View {
    
    //MARK: - PROPERTIS
    let currency: Currency
    @Environment(\.colorScheme) var colorScheme
    
    //MARK: - BODY
    var body: some View {
        HStack {
                Text(currency.name)
            Spacer()
            HStack {
                Text(currency.rate.asValueWithTwoDecimals())
                Text(currency.code)

            }
        }
        .padding(.horizontal, 10)
        .font(.subheadline)
        .frame(
            width: UIScreen.main.bounds.width * 0.9,
            height: 55,
            alignment: .center)
        .background(
            Color.color.adaptiveColor
                .opacity(0.5)
                .cornerRadius(10))
    }
}

//MARK: - PREVIEW
/// Данное превью настроено так, чтоб только отображать необходимый элемент маленького размера для удобства настройки.
/// - Созданы 2 окошка с фейковыми данными
/// - Использованы темная и светлая тема
/// - Окошки небольших размеров, для удобности
struct CurrencyTemplate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CurrencyTemplate(currency: dev.currency)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
                .padding()
            CurrencyTemplate(currency: dev.currency)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
