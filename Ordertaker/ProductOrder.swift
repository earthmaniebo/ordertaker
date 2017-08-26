//
//  ProductOrder.swift
//  Ordertaker
//
//  Created by Earth Maniebo on 8/26/17.
//  Copyright © 2017 Earth Maniebo. All rights reserved.
//

import Foundation
import RealmSwift

class ProductOrder: Object {
    dynamic var product: Product?
    dynamic var quantity = 0
}
