//
//  SearchTemplate.swift
//  iCrypto
//
//  Created by Майлс on 05.07.2022.
//

import SwiftUI

struct SearchTemplate: View {
    
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            searchTextfield
            if text != "" {
                clearTextButton
            }
        }
        .frame(
            width: UIScreen.main.bounds.width * 0.9,
            height: 45,
            alignment: .center)
        .addBorder(Color.gray, cornerRadius: 10)
    }
}

//MARK: - EXTENSION
extension SearchTemplate {
    //VIEW
    private var searchTextfield: some View {
        TextField("Введите название", text: $text)
            .padding(.leading)
            .frame(height: 40)
    }
    
    //BUTTONS
    private var clearTextButton: some View {
        Button(action: {
            text = ""
            UIApplication.shared.dismissKeyboard()
        }) {
            Text("Отмена")
                .font(.caption)
                .padding(.trailing)
        }
    }
}

//MARK: - PREVIEW
struct SearchTemplate_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchTemplate(text: .constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
                .padding()
            
            SearchTemplate(text: .constant(""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
