//
//  CitySearchEngineTests.swift
//  SearchCityAppTests
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import XCTest
@testable import SearchCityApp

class CitySearchEngineTests: XCTestCase {

  private var sut: CitySearchEngine!

  func test_WhenSearchingAL_ThenSearchReturnsTwoResults() {
    // given
    let cities: [City] = [
      .init(country: "US", name: "Alabama", _id: 1, coord: .init(lon: 12.3, lat: 11.0)),
      .init(country: "US", name: "Albuquerque", _id: 2, coord: .init(lon: 12.3, lat: 11.0)),
      .init(country: "US", name: "Anaheim", _id: 3, coord: .init(lon: 12.3, lat: 11.0)),
      .init(country: "US", name: "Arizona", _id: 4, coord: .init(lon: 12.3, lat: 11.0)),
      .init(country: "AU", name: "Sydney", _id: 5, coord: .init(lon: 12.3, lat: 11.0))
    ]
    self.sut = CitySearchEngine(cities: cities)

    // when
    let results = self.sut.search("al")

    // then
    XCTAssertEqual(results.count, 2)
  }
}
