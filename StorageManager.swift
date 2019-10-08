//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Адель Рахимов on 08/10/2019.
//  Copyright © 2019 Адель Рахимов. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
}
