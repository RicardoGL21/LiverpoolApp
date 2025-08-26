//
//  CustomTextField.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    var action: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            TextField("Ejemplo: Ropa", text: $text)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(.vertical, 12)
                .autocorrectionDisabled()
                .onSubmit {
                    action()
                }
            
            if !text.isEmpty {
                Button{
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 12)
            }
            
        }
        .frame(height: 50)
        .background(Color(.systemGray6))
        .cornerRadius(25)
    }
}

#Preview {
    @State var text = ""
    CustomTextField(text: $text)
}
