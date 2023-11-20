//
//  CurrentData.swift
//  WeatherApp
//
//  Created by Tanish Parmar on 26/10/23.
//

import Foundation
struct CurrentData: Codable{
    let last_updated: String
    let temp_c: Float
    let wind_kph: Float
    let humidity: Int
}
