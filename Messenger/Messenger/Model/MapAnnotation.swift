//
//  MapAnnotation.swift
//  Messenger
//
//  Created by Tanish Parmar on 18/10/23.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation{
    let title: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
