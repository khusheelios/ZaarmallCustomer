//
//  EBookMapVc.swift
//  EBookApp
//
//  Created by apple on 02/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import MapKit

class EBookMapVc: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var addressText: UITextField!
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var mapView : MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        // Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }

        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            let region = CLCircularRegion(center: userLocation, radius: 5000, identifier: "geofence")
            mapView.addOverlay(MKCircle(center: userLocation, radius: 200))
            mapView.setRegion(viewRegion, animated: false)
        }

        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }

    @IBAction func btnBack(_ sender: Any) {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPlaceOrderVc") as! EBookPlaceOrderVc
                        self.present(nextViewController, animated:true, completion:nil)

        
    }
    @IBAction func btnConfromLocation(_ sender: Any) {
    }
    
    @IBAction func btnChageLocatsion(_ sender: Any) {
    }
}
extension EBookMapVc : MKMapViewDelegate{
func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

    var circleRenderer = MKCircleRenderer()
    if let overlay = overlay as? MKCircle {
        circleRenderer = MKCircleRenderer(circle: overlay)
        circleRenderer.fillColor = UIColor.green
        circleRenderer.strokeColor = .black
        circleRenderer.alpha = 0.5

    }
    return circleRenderer
}
}
