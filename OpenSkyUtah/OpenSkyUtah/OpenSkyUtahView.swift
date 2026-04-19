//
//  ContentView.swift
//  OpenSkyUtah
//
//  Created by Tanner Glazier on 10/26/23.
//

import MapKit

struct OpenSkyUtahView: View {
    let openSkyService: OpenSkyService
    
    @State private var message = "Hello world"
    @State private var aircraftStates: [AircraftState] = []
    
    var body: some View {
        TabView {
            aircraft
                .tabitem {
                    Label("Aircraft")
                }

        NavigationStack{
            
            VStack {
                List(aircraftStates) { state in
                    
                }
                Spacer()
                Image(systemName: "Airplane")
                
            }
            .listStyle(.plain)
            .navigationTitle("OpenSky Utah")
            .toolbar {
                Button(action: {
                                    updateAircraftDataFromServer()
                                }, label: {
                                    Text("Update")
                                })

            }
        }
        .onAppear {
            if let data = Constants.sampleData.data(using: .utf8)
        }
        
        }
    }
    
    
    
private func updateAircraftDataFromServer() {
    if let url = URL(string: "https://opensky-network.org/api/states/all?lamin=37.0&lomin=-114.0&lamax=42.0&lomax=-109.0") {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data, error == nil {
                updateStates(from: data)
            }
        }
        task.resume()
    }
}
    
private func updateStates(from data: Data) {
    if let json = try? JSONSerialization.jsonObject(with: data) as ? [String: Any] {
        if let states = json["states"] as?[[Any]] {
            aircraftStates = []
            
            states.forEach {state in
                aircraftStates.append(AircraftState(from: state))
            }
        }
    }
}
private struct Constants {
    static let statesKey = "states"
    static let sampleData = """






    """
}
}

#Preview {
    OpenSkyUtahView()
}
