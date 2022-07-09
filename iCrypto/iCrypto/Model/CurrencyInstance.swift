//
//  CurrencyInstance.swift
//  iCrypto
//
//  Created by Майлс on 01.07.2022.
//

import Foundation

/*
 "code":"BTC","name":"Bitcoin","rate":1
 https://bitpay.com/api/rates
 */

/// Структура данных описывающая все свойства экземпляра валюты.
struct Currency: Codable, Hashable {
    let code, name: String
    let rate: Double
}
