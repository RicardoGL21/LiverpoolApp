//
//  CustomLoadAsyncImageFromUrl.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct CustomLoadAsyncImageFromUrl: View {
    var url:String?
    
    var body: some View {
        if let urlUnwrapped = url {
            
            if let url = URL(string: urlUnwrapped) {
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .frame(width: 130, height: 130)
                        .foregroundColor(.gray)
                }
                
            } else {
                
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 130, height: 130)
                
            }
            
        } else {
            
            Image(systemName: "photo")
                .resizable()
                .frame(width: 130, height: 130)
            
        }
    }
}

#Preview {
    CustomLoadAsyncImageFromUrl(url: nil)
}
