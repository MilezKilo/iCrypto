//
//  UIApplication.swift
//  iCrypto
//
//  Created by Майлс on 05.07.2022.
//

import SwiftUI

///Расширение к UIApplication, в котором добавлен метод, при вызове которого убирается клавиатура.
extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
