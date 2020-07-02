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
    
    override func setUp()  {
        // given
        let cities: [City] = [
            .init(country: "US", name: "Alabama", _id: 1, coord: .init(lon: 12.3, lat: 11.0)),
            .init(country: "US", name: "Albuquerque", _id: 2, coord: .init(lon: 12.3, lat: 11.0)),
            .init(country: "US", name: "Anaheim", _id: 3, coord: .init(lon: 12.3, lat: 11.0)),
            .init(country: "US", name: "Arizona", _id: 4, coord: .init(lon: 12.3, lat: 11.0)),
            .init(country: "AU", name: "Sydney", _id: 5, coord: .init(lon: 12.3, lat: 11.0))
        ]
        self.sut = CitySearchEngine(cities: cities)
        
    }
    override func tearDown()  {
        sut = nil
    }
    
    func test_WhenSearchingAL_ThenSearchReturnsTwoResults() {
        // given
        
        // when
        let results = sut.search("al")
        
        // then
        XCTAssertEqual(results.count, 2)
    }
}

class CitySearchEngineLargeDatasetTests: XCTestCase {
    
    private var sut: CitySearchEngine!
    
    override func setUp()  {
        self.sut = CitySearchEngine(cities: self.getVeryLargeSetOfCities())
    }
    
    override func tearDown()  {
        self.sut = nil
    }
    
    private func getVeryLargeSetOfCities() -> [City] {
       let bundle = Bundle(for: type(of: self))
       let path = bundle.path(forResource: "cities", ofType: "json")!
       let string = try! String.init(contentsOfFile: path)
       let data = string.data(using: .utf8)!
       let cities = try! JSONDecoder().decode([City].self, from: data)
       return cities
     }
    
    func test_WhenSearching_al_ThenReturns3019Result() {
        // given
        
        // when
        var results: [City] = []
        self.measure {
            results = self.sut.search("al")
        }
        
        // then
        XCTAssertEqual(results.count, 3019)
    }
    
    func test_WhenSearching_alabama_ThenReturnsOneResult() {
        // given
        
        // when
        var results: [City] = []
        self.measure {
            results = self.sut.search("alabama")
        }
        
        // then
        XCTAssertEqual(results.count, 1)
    }
    
    func test_WhenSearching_ALABAMA_ThenReturnsOneResult() {
        // given
        
        // when
        var results: [City] = []
        self.measure {
            results = self.sut.search("ALABAMA")
        }
        
        // then
        XCTAssertEqual(results.count, 1)
    }
    
    func test_WhenSearching_abu1_ThenReturnsZeroResults() {
        // given
        
        // when
        var results: [City] = []
        self.measure {
            results = self.sut.search("abu1")
        }
        
        // then
        XCTAssertEqual(results.count, 0)
    }
}
