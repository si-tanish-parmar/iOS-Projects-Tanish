//
//  Product.swift
//  ShoppingApp
//
//  Created by Tanish Parmar on 31/10/23.
//

import Foundation

struct Product: Decodable{
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable{
    let rate: Double
    let count: Int
}
