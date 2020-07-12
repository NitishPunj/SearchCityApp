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
        let text = text.lowercased()
        var left = 0
        var right = cities.count - 1
        var results = [City]()
        
        while left <= right {
            let middle = (left + right) / 2
            let city = cities[middle]
            let name = city.name.lowercased()
            
            if name.hasPrefix(text) {
                
                // We have our first result
                results.append(city)
                
                // As the results are sorted, we can safely assume the matching prefixed cities are either on the right side of the current match or on the left side.
                
                // Start checking on the left side
                results.append(contentsOf: search(from: middle-1, to: 0, text: text))
                
                // Start checking on the right side
                results.append(contentsOf: search(from: middle+1, to: cities.count, text: text))
                
                break
                
            } else if text > name {
                // Search text falls on the right side
                left = middle + 1
            } else {
                // Search text falls on the left side
                right = middle - 1
            }
        }
        
        return results
    }
    
    private func search(from startIndex: Int, to endIndex: Int, text: String) -> [City] {
        guard startIndex >= 0, endIndex <= cities.count else { return [] }
        
        var results = [City]()
        let strideBy = (startIndex > endIndex) ? -1 : 1
        for i in stride(from: startIndex, to: endIndex, by: strideBy) {
            let city = cities[i]
            if city.name.lowercased().hasPrefix(text.lowercased()) {
                results.append(city)
            } else {
                break
            }
        }
        return results
    }
}

