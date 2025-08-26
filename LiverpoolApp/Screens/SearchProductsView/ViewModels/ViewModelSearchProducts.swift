//
//  ViewModelSearchProducts.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import Foundation

class ViewModelSearchProducts: ObservableObject {
    
    @Published var productToFind: String = ""
    
    @Published var isSearchingLoading: Bool = false
    @Published var isSearchingListLoading: Bool = false
    
    @Published var listProducts: [ProductDescription] = []
    
    @Published var sorts: [SortOptions] = []
    
    @Published var pageNumber: Int = 1
    
    @Published var hasMorePages: Bool = true
    
    @Published var sortOptionSelected: String = ""
    
    func searchProducts(pageNumber: Int = 1, sortOption: String = "") {
        
        var sortingQuery = ""
        
        
        if pageNumber != 1 {
            if !sortOptionSelected.isEmpty {
                sortingQuery = "&sort-option=\(sortOptionSelected)"
            }
            self.isSearchingListLoading = true
            self.pageNumber += 1
        } else {
            if !sortOption.isEmpty {
                sortOptionSelected = sortOption
                sortingQuery = "&sort-option=\(sortOptionSelected)"
            } else {
                sortOptionSelected = ""
            }
            self.isSearchingLoading = true
            self.pageNumber = 1
        }
        
        let urlString = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=\(self.pageNumber)&search-string=\(productToFind)\(sortingQuery)&force-plp=false&number-of-items-per-page=40&cleanProductName=false"
                
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data {
                    
                    do {
                        let decoded = try JSONDecoder().decode(ResponseSearchProducts.self, from: data)
                        DispatchQueue.main.async {
                            
                            DispatchQueue.main.async {
                                self.sorts = decoded.plpResults?.sortOptions ?? []

                                let newProducts = decoded.plpResults?.records ?? []

                                if self.pageNumber != 1 {
                                    
                                    let filteredProducts = newProducts.filter { newItem in
                                        !self.listProducts.contains(where: { $0.productId == newItem.productId })
                                    }
                                    
                                    self.listProducts.append(contentsOf: filteredProducts)
                                    self.isSearchingListLoading = false

                                    if filteredProducts.isEmpty {
                                        self.hasMorePages = false
                                    }
                                    
                                } else {
                                    self.listProducts = newProducts
                                    self.isSearchingLoading = false
                                    self.hasMorePages = !newProducts.isEmpty
                                }
                            }
                            
                        }
                    } catch {
                        print(error)
                    }
                    
                } else {
                    print("Data error")
                }
                
            }.resume()
            
        } else {
            print("URL invalid")
        }
    }
    
    func clearSearch() {
        self.listProducts.removeAll()
    }
    
}
