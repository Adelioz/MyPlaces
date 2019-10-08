//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Адель Рахимов on 08/10/2019.
//  Copyright © 2019 Адель Рахимов. All rights reserved.
//

import UIKit


struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    static let restaurantNames = [
            "Fomin", "Manufact", "Filter", "Skuratov",
            "Botanica", "McDonald", "Bikitzer", "Punk Brew",
            "Civil", "Fika", "TFC", "Salut",
            "Bolshe", "Fenster", "Verle"
        ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Kazan", type: "Bar", image: nil, restaurantImage: place))
        }
        
        return places
    }
}
