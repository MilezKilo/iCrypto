//
//  PreviewProvider.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import SwiftUI

/// Расширение к PreviewProvider для отображения фейковой монеты
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

/// Класс содержащий в себе синглетон для отображение в превьюшке фейковой монеты
class DeveloperPreview {
    ///Синглетон, для отображения в превью.
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let currency = Currency(code: "USD", name: "US Dollar", rate: 25000.0000)
}
