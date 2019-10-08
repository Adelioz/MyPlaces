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
   
    convenience init(name: String, location: String?, type: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
    }
}
