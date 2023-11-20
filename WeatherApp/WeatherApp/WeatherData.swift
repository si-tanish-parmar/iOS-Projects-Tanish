//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Tanish Parmar on 26/10/23.
//

import Foundation
struct WeatherData: Codable{
    let location: LocationData
    let current: CurrentData
}
