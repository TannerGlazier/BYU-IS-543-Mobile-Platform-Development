//
//  Utah.swift
//  OpenSkyUtah
//
//  Created by Stephen Liddle on 11/14/23.
//

import MapKit

struct Utah {
    
    // MARK: - Public Constants
    static let latitudeMax = 42.0
    static let latitudeMin = 37.0
    static let longitudeMax = -109.0
    static let longitudeMin = -114.0
    
    // MARK: - Private Constants
    private static let margin = 1.05
    
    //MARK: - Private Computed Properties
    private static var center: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: latitudeMin + (latitudeMax - latitudeMin) / 2,
            longitude: longitudeMin + (longitudeMax - longitudeMin) / 2
        )
    }
    private static var span: MKCoordinateSpan {
        MKCoordinateSpan(
            latitudeDelta: abs(latitudeMax - latitudeMin) * margin,
            longitudeDelta: abs(longitudeMax - longitudeMin) * margin
        )
    }
    static var urlString: String {
        """
            \(baseApiUrl)\
            \(getStatesApi)?\
            lamin=\(Utah.latitudeMin)&\
            lomin=\(Utah.longitudeMin)&\
            lamax=\(Utah.latitudeMax)&\
            lomax=\(Utah.longitudeMax)
        """
    }
    
    // MARK: - Public Computed Properties
    static var region: MKCoordinateRegion {
        MKCoordinateRegion(center: center, span: span)
    }
    
    static var openSkyUrl: URL?  = URL(string: urlString)
    
    
}
