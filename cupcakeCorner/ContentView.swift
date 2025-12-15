//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by ca5 on 15/12/25.
//

import SwiftUI

@Observable
class user : Codable {
    enum CodingKeys : String, CodingKey {
        case _name = "name"
    }
    var name = "test"
}


struct ContentView: View {
    @State private var tes = 0
    var body: some View {
        
        Button ("encode test"){
            tes += 1
        }
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: tes)
            
    }
        
    func encd(){
        let data  = try! JSONEncoder().encode(user())
        let decoded = String(decoding: data, as: UTF8.self)
        print(decoded)
    }
}

#Preview {
    ContentView()
}
