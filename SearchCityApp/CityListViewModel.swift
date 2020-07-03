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
    
    private let searchEngine: CitySearchEngine
    private var cities: [City]
    
    init() {
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json"),
            let string = try? String.init(contentsOfFile: path),
            let data = string.data(using: .utf8),
            let cities = try? JSONDecoder().decode([City].self, from: data) else {
                fatalError("Failed to load cities.json")
        }
        self.cities = cities.sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
        self.viewModels = self.cities.map(CityViewModel.init)
        self.searchEngine = CitySearchEngine(cities: self.cities)
    }
    
    func search(_ text: String?, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let text = text, text.count > 0 else {
                self.viewModels = self.cities.map(CityViewModel.init)
                return completion()
            }
            self.viewModels = self.searchEngine.search(text)
                .sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
                .map(CityViewModel.init)
            completion()
        }
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



