//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by ca5 on 15/12/25.
//

import SwiftUI

struct result : Codable {
    let trackId : Int
    let trackName : String
    let collectionName : String
}
struct response : Codable {
    let results : [result]
}

struct ContentView: View {
    @State private var resArray : [result] = []
    var body: some View {
        List{
            VStack(alignment: .leading){
                ForEach(resArray, id: \.trackId){
                    k in
                    Text(k.trackName)
                        .font(.title)
                    Text(k.collectionName)
                        .font(.headline)
                    Divider()
                }
                
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=linkin+park&entity=song") else {
            print("error")
            return
        }
        
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(response.self, from: data) {
                resArray = decodedResponse.results
            }
        } catch {
            print(error)
        }
        
    }
}

#Preview {
    ContentView()
}
