//
//  AircraftStateCell.swift
//  OpenSkyUtah
//
//  Created by Tanner Glazier on 10/31/23.
//

import SwiftUI

struct AircraftStateCell: View {
    let aircraftState: AircraftState
    
    var body: some View{
        HStack{
            VStack(alignment: .leading) {
                Text(aircraftState.flight)
                Text("\(state.altitude), \(state.speed), \(state.ascentRate)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
