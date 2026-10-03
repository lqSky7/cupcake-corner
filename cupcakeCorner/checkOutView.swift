//
//  checkOutView.swift
//  cupcakeCorner
//
//  Created by ca5 on 16/12/25.
//

import SwiftUI

struct checkOutView: View {
    let orderInstance : order
    @State var showingAlert = false;
    @State var alertMessage = "Failed"
    var body: some View {
        NavigationStack{
            Text("Your total is 50$")
            Button("Place Order"){
                Task{
                    await placeOrder()
                }
            }.buttonStyle(.borderedProminent)

        }
        .alert(alertMessage, isPresented: $showingAlert) {
            //nothing
        } message: {
            Text("TY(")
        }
        
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(orderInstance) else {
            print("failed to place order.")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONSerialization.jsonObject(with: data)
            
            alertMessage = "Your order of \(decodedOrder.name) has been placed successfully"
            showingAlert = true
        } catch {print(error.localizedDescription)}
    }
}

#Preview {
    checkOutView(orderInstance: order())
}
