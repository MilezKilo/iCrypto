//
//  View.swift
//  iCrypto
//
//  Created by Майлс on 05.07.2022.
//

import SwiftUI

///Расширение добавляющее модификатор обрамления с закругленными краями.
extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }
