//
//  Colors.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import SwiftUI

/// Кастомное расширение с существующим цветовым палитрам.
extension Color {
    static let color = ColorTheme()
}

/// Структура с 2 свойствами, описывающими, как должны выглядеть цвета в светлой и темной теме.
struct ColorTheme {
    let adaptiveColor = Color("AdaptiveColorTheme")
}
