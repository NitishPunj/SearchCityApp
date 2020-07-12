//
//  CityListViewModelTests.swift
//  SearchCityAppTests
//
//  Created by N Sharma on 12/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import XCTest
@testable import SearchCityApp

class CityListViewModelTests: XCTestCase {
    
    private var viewModel: CityListViewModel!
    
    override func setUp()  {
        super.setUp()
        viewModel = CityListViewModel()
    }
    
    override func tearDown()  {
        super.tearDown()
        viewModel = nil
    }
    
    func testSearch() {
        let exp = expectation(description: "SearchLondon")
        
        viewModel.search("London") {
            XCTAssertEqual(self.viewModel.viewModels.count, 13)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("waitForExpectations errored: \(error)")
            }
        }
    }
    
    func testSearch_ResulsOrder() {
        let exp = expectation(description: "SearchLondon_Sorted")
        
        viewModel.search("London") {
            XCTAssertEqual(self.viewModel.viewModels.count, 13)
            let result1 = self.viewModel.viewModels[0]
            XCTAssertEqual(result1.title, "London, CA")
            
            let result2 = self.viewModel.viewModels[1]
            XCTAssertEqual(result2.title, "London, GB")
            
            XCTAssertTrue(result1.title < result2.title)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { error in
            if let error = error {
                XCTFail("waitForExpectations errored: \(error)")
            }
        }
    }
    
    
}


