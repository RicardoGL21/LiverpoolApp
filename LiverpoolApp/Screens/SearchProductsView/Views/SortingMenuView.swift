//
//  SortingMenuView.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import SwiftUI

struct SortingMenuView: View {
    
    @EnvironmentObject var viewModel: ViewModelSearchProducts
    
    @State private var selectedFilter: String = "Default"
        
    var body: some View {
        Menu {
            
            ForEach(viewModel.sorts, id: \.sortBy) { filter in
                Button(action: {
                    
                    selectedFilter = filter.label ?? ""
                    viewModel.searchProducts(sortOption: filter.sortBy ?? "")
                    print(filter)
                    
                }) {
                    HStack {
                        
                        Text(filter.label ?? "")
                        if selectedFilter == filter.label ?? "" {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
        } label: {
            
            HStack {
                
                Spacer()
                
                Text("Ordenar por: \(selectedFilter)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25,height: 25)
                    .foregroundColor(Color.purple)
                
            }
            .padding(.horizontal, 20)
            
        }
        .padding(.top,10)
    }
}

#Preview {
    SortingMenuView()
}
