//
//  ItemProduct.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct ItemProduct: View {
    
    var productDescription: ProductDescription
    
    var body: some View {
        VStack {
            
            HStack {
                
                CustomLoadAsyncImageFromUrl(url: productDescription.galleryImagesVariants?.first)
                
                Spacer()
                
                DescriptionOfTheProduct(productDescription: productDescription)
                
                Spacer()
                
            }
            .padding()
            
        }
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal,20)
        .frame(maxHeight: 190)
    }
}

struct DescriptionOfTheProduct: View {
    
    var productDescription: ProductDescription
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text(productDescription.productDisplayName ?? "Error")
                .font(.system(size: 17.0, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
            
            if let listPrice = productDescription.listPrice {
                
                if let promoPrice = productDescription.promoPrice, promoPrice < listPrice {
                    
                    CustomTextWithLine(text: String(listPrice))
                    Text(String(promoPrice))
                        .foregroundStyle(Color.red)
                    
                } else {
                    
                    Text(String(listPrice))
                        .foregroundStyle(Color.red)
                    
                }
                
            } else {
                
                Text("Error")
                    .foregroundStyle(Color.red)
                
            }
            
            if let variantsColor = productDescription.variantsColor {
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(variantsColor, id: \.colorName) { item in
                            Color(hexColor: item.colorHex ?? "#FFFFFF")
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                    }
                }
                
            }
            
            Spacer()
        }
    }
}
