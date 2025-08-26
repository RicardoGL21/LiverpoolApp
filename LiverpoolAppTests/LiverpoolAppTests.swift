//
//  LiverpoolAppTests.swift
//  LiverpoolAppTests
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import Foundation
import XCTest
import Testing
@testable import LiverpoolApp

struct LiverpoolAppTests {

    @Test func addProductToTheList() async throws {
        let vm = ViewModelSearchProducts()
        vm.productToFind = "Playera"
        vm.listProducts.append(ProductDescription(productId: "324234D", productDisplayName: "Playera", TituloSinMarca: "Playera", listPrice: 900.0, promoPrice: 900.0, variantsColor: nil, galleryImagesVariants: nil))
        print("Producto agregado -> \(vm.listProducts)")
        XCTAssertEqual(vm.listProducts.count, 1, "La lista de productos debería de tener 1 producto")
    }
    
    @Test func cleanTheProducts() async throws {
        let vm = ViewModelSearchProducts()
        vm.listProducts.append(ProductDescription(productId: "324234D", productDisplayName: "Cartera", TituloSinMarca: "Cartera", listPrice: 900.0, promoPrice: 900.0, variantsColor: nil, galleryImagesVariants: nil))
        print("Producto por borrar -> \(vm.listProducts)")
        vm.clearSearch()
        XCTAssertEqual(vm.listProducts.count, 0, "La lista de productos esta vacia")
    }
    
    @Test func loadingVariable() async throws {
        let vm = ViewModelSearchProducts()
        print("Esta cargando la lista: -> \(vm.isSearchingLoading)")
        vm.isSearchingLoading = true
        print("Esta cargando la lista: -> \(vm.isSearchingLoading)")
        XCTAssertEqual(vm.isSearchingLoading, true, "La lista de productos esta cargando")
    }
    

}
