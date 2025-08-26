//
//  ListOfTheProductsView.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct ListOfTheProductsView: View {
    
    @EnvironmentObject var viewModel: ViewModelSearchProducts
    
    var body: some View {
        ScrollView {
            
            if viewModel.productToFind.isEmpty {
                
                Text("Para iniciar, ingresa un producto en la barra de búsqueda y presiona Enter para realizar la búsqueda.")
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
            } else {
                
                if viewModel.isSearchingLoading {
                    
                    ProgressView()
                        .padding(.top,30)
                    
                } else {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.listProducts, id: \.productId) { item in
                            
                            VStack {
                                ItemProduct(productDescription: item)
                                
                                Divider()
                            }
                            .task {
                                if let lastItem = viewModel.listProducts.last, item.productId == lastItem.productId && viewModel.hasMorePages {
                                    viewModel.searchProducts(pageNumber: viewModel.pageNumber + 1)
                                }
                            }
                            
                        }
                        
                        if viewModel.isSearchingListLoading {
                            ProgressView()
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }
}

/*#Preview {
    ListOfTheProductsView()
}*/
