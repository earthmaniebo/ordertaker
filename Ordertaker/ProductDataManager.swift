//
//  ProductDataManager.swift
//  Ordertaker
//
//  Created by Earth Maniebo on 8/26/17.
//  Copyright © 2017 Earth Maniebo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ProductDataManager {
    static func add(_ product: Product) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(product, update: true)
        }
    }
    
    static func get() -> Results<Product> {
        let realm = try! Realm()
        let products = realm.objects(Product.self)
        return products
    }
    
    static func get(name: String) -> Product? {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "name = %@", name.lowercased())
        let product = realm.objects(Product.self).filter(predicate).first
        return product
    }
    
    static func get(id: Int) -> Product? {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "id = %d", id)
        let product = realm.objects(Product.self).filter(predicate).first
        return product
    }
    
    static func edit(_ product: Product, keys: [String], values: [Any?]) {
        let realm = try! Realm()
        for item in 0..<keys.count {
            try! realm.write {
                product.setValue(values[item], forKey: keys[item])
            }
        }
    }
    
    static func delete(_ product: Product) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(product)
        }
    }
}
