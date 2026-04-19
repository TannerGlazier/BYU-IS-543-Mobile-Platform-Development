//
//  OpenSkyUtahView.swift
//  OpenSkyUtah
//
//  Created by Stephen Liddle on 10/26/23.
//

import SwiftUI
import MapKit

struct OpenSkyUtahView: View {

    let openSkyService: OpenSkyService

    var body: some View {
        TabView {
            aircraftList
            .tabItem {
                Label("Aircraft", systemImage: "list.bullet")
            }

            aircraftMap
            .tabItem {
                Label("Map", systemImage: "map")
            }
        }
        .onAppear {
            openSkyService.loadSampleData()
        }
    }

    private var aircraftList: some View {
        NavigationStack {
            VStack {
                List(openSkyService.aircraftStates) { state in
                    AircraftStateCell(aircraftState: state)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Constants.title)
            .toolbar { toolbarView }
        }
    }

    private var aircraftMap: some View {
        NavigationStack {
            ZStack{
                Map(initialPosition: .region(Utah.region)) {
                    ForEach(openSkyService.locatedAircraftStates) { state in
                        Annotation(labelText(for: state), coordinate: state.coordinate) {
                            Image(systemName: "airplane")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                                .rotationEffect(Angle(degrees: state.heading))
                                .onTapGesture {
                                    openSkyService.toggleDetailVisibility(for: state)
                                }
                        }
                    }
                }
                .mapStyle(.standard)
                .mapControlVisibility(.visible)
             //   .navigationTitle(Constants.title)
             //   .toolbar { toolbarView }
            toolbarView                    .padding(Constants.buttonPadding)
                .background(in: Circle())
                .padding(Constants.floatPadding)

            }
        }
    }
    
    private func labelText(for aircraftState: AircraftState) -> String{
        if aircraftState.detailsVisible {
            """
            \(aircraftState.flight)
            \(aircraftState.altitude)
            \(aircraftState.speed)
            \(aircraftState.ascentRate)
            """
            
        }
    }

    private var toolbarView: some View {
        Button(action: {
            openSkyService.refreshStatus()
        }, label: {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
        })
    }

    private struct Constants {
        static let title = "OpenSky Utah"
        static let floatPadding = 30.0
        static let buttonPadding = 10.0
    }
}

#Preview {
    OpenSkyUtahView(openSkyService: OpenSkyService())
}
