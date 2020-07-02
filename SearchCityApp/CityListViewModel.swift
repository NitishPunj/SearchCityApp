//
//  CityListViewModel.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import Foundation

final class CityListViewModel {

  private(set) var viewModels: [CityViewModel]

  init(viewModels: [CityViewModel] = []) {
    self.viewModels = []
  }

  func load(_ completion: @escaping () -> Void) {

  }
}

final class CityViewModel {

  let city: City

  let title: String
  let coordinates: String

  init(city: City) {
    self.city = city

    self.title = city.name + ", " + city.country
    self.coordinates = "\(city.coord.lat),\(city.coord.lon)"
  }
}
