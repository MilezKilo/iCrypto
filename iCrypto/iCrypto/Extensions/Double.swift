//
//  Double.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import Foundation

extension Double {
    
    ///Вычисляемое свойство, ограничивающее максимальное количество символов после запятой до 2.
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2 // Минимальное количество символов после запятой
        formatter.maximumFractionDigits = 2 // Максимальное количество символов после запятой
        return formatter
    }
    
    ///Метод, возвращающий numberFormatter как строку для отображения.
    func asValueWithTwoDecimals() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "0.00$"
    }
}
