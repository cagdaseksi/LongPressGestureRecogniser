//
//  ViewController.swift
//  LongPressGestureRecogniser
//
//  Created by MAC on 30/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGestureRecogn.minimumPressDuration = 2.0
        myMapView.addGestureRecognizer(longPressGestureRecogn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addAnnotation(press:UILongPressGestureRecognizer)
    {
        if press.state == .began
        {
            let location = press.location(in: myMapView)
            let coordinates = myMapView.convert(location, toCoordinateFrom: myMapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            
            annotation.title = "My favorite place"
            annotation.subtitle = "This is my favorite place"
            
            myMapView.addAnnotation(annotation)
        }
    }

}

