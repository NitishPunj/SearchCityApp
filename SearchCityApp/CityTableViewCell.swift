//
//  CityTableViewCell.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import UIKit

final class CityTableViewCell: UITableViewCell {

  func set(viewModel: CityViewModel) {
    textLabel?.text = viewModel.title
    detailTextLabel?.text = viewModel.coordinates
  }
}
