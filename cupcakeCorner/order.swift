//
//  order.swift
//  cupcakeCorner
//
//  Created by ca5 on 16/12/25.
//

import Foundation
@Observable
class order {
    let types = ["vanilla", "strawberry", "choco", "coffee"]
    
    var type = 0
    var quantity = 2

    var specialRequest = false
    var addSprinkles = false
    var extraFrosting = false
    
}
