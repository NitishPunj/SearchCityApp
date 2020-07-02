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
    self.cities = cities
  }

  func search(_ text: String) -> [City] {
    return []
  }
}
