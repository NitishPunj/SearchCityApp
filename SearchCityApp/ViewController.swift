//
//  ViewController.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

      private struct Constants {
        static let reuseId = "cityCell"
      }

      @IBOutlet weak var tableView: UITableView!

      let viewModel = CityListViewModel()

      override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.load {
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        }
      }
    }

    extension ViewController: UITableViewDataSource {

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.viewModels.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseId, for: indexPath) as? CityTableViewCell else {
          fatalError()
        }
        cell.set(viewModel: viewModel.viewModels[indexPath.row])
        return cell
      }
    }


