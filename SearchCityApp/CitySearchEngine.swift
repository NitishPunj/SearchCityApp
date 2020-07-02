//
//  CitySearchEngine.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import Foundation

final class CitySearchEngine {

  let cities: [City]

  init(cities: [City]) {
     // Ordering cities by ascending order
        self.cities = cities.sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
  }

  func search(_ text: String) -> [City] {
    return []
  }
}
