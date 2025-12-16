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
    
    var specialRequest = false {
        didSet {
            if specialRequest == false {
                addSprinkles = false
                extraFrosting = false
            }
        }
    }
    var addSprinkles = false
    var extraFrosting = false
    
    var name = ""
    var zip = ""
    var city = ""
    var street = ""
    
    var hasValidDataForAddressPage: Bool {
        if (name.isEmpty || zip.isEmpty || city.isEmpty || street.isEmpty) {
            return false
        }
        return true
    }
}
