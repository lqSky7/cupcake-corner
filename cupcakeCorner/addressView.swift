//
//  addressView.swift
//  cupcakeCorner
//
//  Created by ca5 on 16/12/25.
//

import SwiftUI

struct addressView: View {
    @Bindable var orderInstance : order
    var body: some View {
        TextField("Enter city", text: $orderInstance.city)
        TextField("Enter zip", text: $orderInstance.zip)
        TextField("Enter name", text: $orderInstance.name)
        TextField("Enter street", text: $orderInstance.street)
    }
}

#Preview {
    addressView(orderInstance: order())
}
