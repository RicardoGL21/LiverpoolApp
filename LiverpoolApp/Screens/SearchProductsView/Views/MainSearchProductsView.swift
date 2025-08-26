//
//  ContentView.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct MainSearchProductsView: View {
    
    @StateObject var viewModel: ViewModelSearchProducts = ViewModelSearchProducts()
    
    var body: some View {
        VStack {
            
            TopBarSearchProductView()
            
            if !viewModel.listProducts.isEmpty {
                SortingMenuView()
            }
            
            ListOfTheProductsView()
            
        }
        .environmentObject(viewModel)
        .background(ignoresSafeAreaEdges: .top)
        .onChange(of: viewModel.productToFind) { newValue in
            if newValue.isEmpty {
                viewModel.clearSearch()
            }
        }
        
    }
}


#Preview {
    MainSearchProductsView()
}
