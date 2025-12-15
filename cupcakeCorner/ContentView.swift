//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by ca5 on 15/12/25.
//

import SwiftUI
import CoreHaptics

@Observable
class user : Codable {
    enum CodingKeys : String, CodingKey {
        case _name = "name"
    }
    var name = "test"
}


struct ContentView: View {
    @State private var tes = 0
    @State private var engine : CHHapticEngine?
    var body: some View {
        
        Button ("encode test"){
            complexSuc()
        }.onAppear(perform: prepareHaptics)
        
            
    }
        
    func encd(){
        let data  = try! JSONEncoder().encode(user())
        let decoded = String(decoding: data, as: UTF8.self)
        print(decoded)
    }
    
    func prepareHaptics(){
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
        
        do {
             engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("failed")
        }
    }
    
    func complexSuc(){
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {return}
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
         events = [event]
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
