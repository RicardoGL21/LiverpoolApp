//
//  TopBarSearchProductView.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct TopBarSearchProductView: View {
    
    @EnvironmentObject var viewModel: ViewModelSearchProducts
    
    var body: some View {
        VStack {
            Image(.icLiverpoolWhite)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 30)
            
            CustomTextField(text: $viewModel.productToFind, action: { viewModel.searchProducts() })
                .padding(.horizontal, 20)
            
            Spacer()
                .frame(height: 15)
        }
        .background(Color(hexColor: "#E00198")?.ignoresSafeArea(edges: .top))
    }
    
}

/*#Preview {
    TopBarSearchProductView()
}*/
