//
//  ContentView.swift
//  MapIt2023
//
//  Created by Tanner Glazier on 9/9/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    private var formatter = NumberFormatter()
    
    @State private var latitudeValue = "40.2503"
    @State private var longitudeValue = "-111.65231"
    //@State private var mapRegion = MKCoordinateRegion(
        //center: CLLocationCoordinate2D(latitude: 40, longitude: -111),
        //span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center:CLLocationCoordinate2D(latitude: 40, longitude: -111),
            span:MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        )
    )
    
    var body: some View {
        VStack {
            HStack{
                TextField("latitude", text: $latitudeValue)
                TextField("Longitude", text: $longitudeValue)
                Button("Map It"){
                    updateMapRegion()
                }
            }
            .padding(.horizontal, 20)

            // Map(coordinateRegion: $mapRegion)
            Map(position: $cameraPosition)
                .mapStyle(MapStyle.hybrid(showsTraffic:true))
                .mapControls{
                    MapScaleView()
                }
                .edgesIgnoringSafeArea(Edge.Set/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //.onAppear{
                    //updateMapAppearance()
                //}
        }
    }
    //func updateMapAppearance(){
        //let map = MKMapView.appearance()
        //map.mapType = .satellite
        //map.showsTraffic = true
        //map.showsBuildings = true
        //map.showsScale = true
        //map.isRotateEnabled = true
    //}
    
    private func updateMapRegion(){
        withAnimation {
            if let latitude = formatter.number(from: latitudeValue),
               let longitude = formatter.number(from: longitudeValue) {
                    //mapRegion.center = CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
                    //mapRegion.span.latitudeDelta = 0.0015
                    //mapRegion.span.longitudeDelta = 0.0015
                    cameraPosition = MapCameraPosition.region(
                        MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: latitude.doubleValue,
                                    longitude: longitude.doubleValue
                                ),
                                span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
                        )
                    )
                }
            }
        }
    }

#Preview {
    ContentView()
}
