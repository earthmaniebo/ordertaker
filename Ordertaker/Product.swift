//
//  Product.swift
//  Ordertaker
//
//  Created by Earth Maniebo on 8/26/17.
//  Copyright © 2017 Earth Maniebo. All rights reserved.
//

import Foundation
import RealmSwift

class Product: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var productDescription = ""
    dynamic var price = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["name"]
    }
}
