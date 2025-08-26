//
//  ResponseSearchProducts.swift
//  LiverpoolApp
//
//  Created by Ricardo Garcia Lopez on 26/08/25.
//

import Foundation

struct ResponseSearchProducts: Codable {
    let status: Status?
    let plpResults: PLPResults?
}

struct Status: Codable {
    let status: String?
    let statusCode: Int?
}

struct PLPResults: Codable {
    let records: [ProductDescription]?
    let sortOptions: [SortOptions]?
}

struct ProductDescription: Codable {
    let productId: String?
    let productDisplayName: String?
    let TituloSinMarca:String?
    let listPrice: Double?
    let promoPrice: Double?
    let variantsColor: [VariantsColor]?
    let galleryImagesVariants: [String]?
}

struct SortOptions: Codable {
    let sortBy: String?
    let label: String?
}

struct VariantsColor: Codable {
    let colorName: String?
    let colorHex: String?
}
