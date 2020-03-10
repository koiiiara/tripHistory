//
//  MapViewController.swift
//  Place
//
//  Created by Илья Миронов on 15/08/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    var lat = CLLocationDegrees()
    var lon = CLLocationDegrees()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self as? MKMapViewDelegate
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func foundTap(_ recognizer: UITapGestureRecognizer) {
        let tapPoint: CGPoint = recognizer.location(in: mapView)
        // let tapPoint: CLLocationCoordinate2D = mapView.convert(point, toCoordinateFrom: mapView)
        let point = MKPointAnnotation()
        point.coordinate = mapView.convert(tapPoint, toCoordinateFrom: mapView)
        mapView.addAnnotation(point)
        lat = mapView.convert(tapPoint, toCoordinateFrom: mapView).latitude
        print(lat)
        lon = mapView.convert(tapPoint, toCoordinateFrom: mapView).longitude
        print(lon)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
