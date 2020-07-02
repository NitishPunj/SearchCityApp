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
        DispatchQueue.global(qos: .userInitiated).async {
            guard let path = Bundle.main.path(forResource: "cities", ofType: "json"),
                let string = try? String.init(contentsOfFile: path),
                let data = string.data(using: .utf8),
                let cities = try? JSONDecoder().decode([City].self, from: data) else {
                    return completion()
            }
            self.viewModels = cities.map(CityViewModel.init)
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
