//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Адель Рахимов on 08/10/2019.
//  Copyright © 2019 Адель Рахимов. All rights reserved.
//

import RealmSwift


class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var restaurantImage: String?
    
    let restaurantNames = [
            "Fomin", "Manufact", "Filter", "Skuratov",
            "Botanica", "McDonald", "Bikitzer", "Punk Brew",
            "Civil", "Fika", "TFC", "Salut",
            "Bolshe", "Fenster", "Verle"
        ]
    
    func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Kazan"
            newPlace.type = "bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
            
        }
        
        
    }
}
