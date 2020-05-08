//
//  Artwork.swift
//  MapKitDemo
//
//  Created by 吴林丰 on 2017/4/27.
//  Copyright © 2017年 吴林丰. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    // annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(CNPostalAddressStreetKey): self.subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
//    
//    class func fromJSON(json:[JSONValue]) -> Artwork? {
//        var title:String
//        if let titelOrNil = json[16].string{
//            title = titelOrNil
//        }else{
//            title = ""
//        }
//        let locationName = json[12].string
//        let discriplinate = json[15].string
//        let latitude = (json[18].string! as NSString).doubleValue
//        let longitude = (json[19].string! as NSString).doubleValue
//        let coordinate = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
//        
//        return Artwork.init(title: title, locationName: locationName!, discipline: discriplinate!, coordinate: coordinate)
//    }
    
    func pinColor() -> UIColor {
        switch discipline {
        case "Sculpture", "Plaque":
            return MKPinAnnotationView.redPinColor()
        case "Mural", "Monument":
            return MKPinAnnotationView.purplePinColor()
        default:
            return MKPinAnnotationView.greenPinColor()
        }
    }
}



