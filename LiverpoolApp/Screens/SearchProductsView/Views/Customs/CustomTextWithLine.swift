//
//  CustomTextWithLine.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct CustomTextWithLine: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color.red)
            .overlay(
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 1.5)
            )
    }
}

#Preview {
    CustomTextWithLine(text: "99999")
}
