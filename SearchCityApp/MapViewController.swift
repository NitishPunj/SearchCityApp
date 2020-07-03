//
//  MapViewController.swift
//  SearchCityApp
//
//  Created by N Sharma on 03/07/2020.
//  Copyright © 2020 SharmaNitish. All rights reserved.
//

import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    var viewModel: CityViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(viewModel.city.coord.lat, viewModel.city.coord.lon)
        annotation.title = viewModel.title
        mapView.addAnnotation(annotation)
        
        mapView.setRegion(.init(center: annotation.coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: false)
    }
}

