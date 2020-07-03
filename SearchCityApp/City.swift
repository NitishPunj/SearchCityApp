//
//  City.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import Foundation

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}

struct City: Decodable {
    let country: String
    let name: String
    let _id: Int
    let coord: Coordinates
}

