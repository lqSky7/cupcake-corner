//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by ca5 on 15/12/25.
//

import SwiftUI


struct ContentView: View {
    @State private var orderInstance = order()
    var body: some View{
        NavigationStack{
            Form {
                Section {
                    
                    Picker("Which cake?", selection: $orderInstance.type) {
                        ForEach(orderInstance.types.indices, id: \.self){
                            k in
                            Text("\(orderInstance.types[k])")
                                .glassEffect(.clear.interactive())
                        }
                    }
                    Stepper("Number of cakes \(orderInstance.quantity)", value: $orderInstance.quantity, in: 3...20)
                    
                }
                
                
                Section {
                    Toggle("Extra Request?", isOn: $orderInstance.specialRequest)
                    
                    if orderInstance.specialRequest {
                        Section {
                            Toggle("Extra Sprinkles?", isOn: $orderInstance.extraFrosting)
                            Toggle("Extra Frosting?", isOn: $orderInstance.addSprinkles)
                        }
                        
                    }
                    
                }
                
                Section() {
                    NavigationLink("Set Address"){
                        addressView(orderInstance: orderInstance)
                    }
                }
                
            }.navigationTitle("Cake")
        }
        }
    }


#Preview {
    ContentView()
}
