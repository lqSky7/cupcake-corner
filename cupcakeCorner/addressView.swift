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
        NavigationStack{
            Section{
                List{
                    TextField("Enter city", text: $orderInstance.city)
                    TextField("Enter zip", text: $orderInstance.zip)
                    TextField("Enter name", text: $orderInstance.name)
                    TextField("Enter street", text: $orderInstance.street)
                }

            }
            .toolbar(){
                ToolbarItemGroup(placement: .bottomBar){
                        NavigationLink{
                            checkOutView(orderInstance: orderInstance)
                    }
                    label : {
                        Text("GO")
                            .font(.title)
                            .fontWidth(.expanded)
                            .padding(.horizontal, 25)
                    }
                        .disabled(!orderInstance.hasValidDataForAddressPage)
                        
                    
                }
            }
            .navigationTitle("Address selection")
            
            }
          
        }
    }


#Preview {
    addressView(orderInstance: order())
}
