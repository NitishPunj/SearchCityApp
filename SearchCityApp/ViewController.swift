//
//  ViewController.swift
//  SearchCityApp
//
//  Created by N Sharma on 02/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Segues: String {
        case openMap
    }
    
    private struct Constants {
        static let reuseId = "cityCell"
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = CityListViewModel()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search a City"
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
}

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.openMap.rawValue,
            let mapVC = segue.destination as? MapViewController,
            let viewModel = sender as? CityViewModel {
            mapVC.viewModel = viewModel
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.search(searchController.searchBar.text) {
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.openMap.rawValue, sender: viewModel.viewModels[indexPath.row])
    }
}
