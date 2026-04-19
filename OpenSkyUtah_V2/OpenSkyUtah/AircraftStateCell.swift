//
//  AircraftStateCell.swift
//  OpenSkyUtah
//
//  Created by Stephen Liddle on 10/31/23.
//

import SwiftUI

struct AircraftStateCell: View {
    let aircraftState: AircraftState

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(aircraftState.flight)
                Text("\(aircraftState.altitude), \(aircraftState.speed), \(aircraftState.ascentRate)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: iconName)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .rotationEffect(Angle(degrees: iconRotation))
        }
    }

    private var iconName: String {
        if aircraftState.verticalRate ?? 0 > 0 {
            "airplane.departure"
        } else if aircraftState.verticalRate ?? 0 < 0 {
            "airplane.arrival"
        } else if aircraftState.onGround {
            "airplane.circle"
        } else {
            "airplane"
        }
    }

    private var iconRotation: Double {
        if aircraftState.verticalRate ?? 0 > 0 {
            0
        } else if aircraftState.verticalRate ?? 0 < 0 {
            0
        } else if aircraftState.onGround {
            270
        } else {
            aircraftState.heading
        }
    }
}

#Preview {
    List {
        AircraftStateCell(aircraftState: AircraftState(from: [
            "a4d97e", "SKW3448 ", "United States",
            1698763574, 1698763574, -111.9791, 40.8048,
            0, true, 0, 84.38, 0, 0, 0,
            "", false, 0
        ]))
        AircraftStateCell(aircraftState: AircraftState(from: [
            "a9af67", "CXK533  ", "United States",
            1698763574, 1698763574, -112.3664, 41.3592,
            1767.84, false, 54.94, 173.01, 0, 0, 1905,
            "", false, 0
        ]))
        AircraftStateCell(aircraftState: AircraftState(from: [
            "a6b5d4", "N531TG  ", "United States",
            1698763573, 1698763573, -112.2438, 40.7986,
            1684.02, false, 40.72, 3.62, 1.3, 0, 1790.7,
            "", false, 0
        ]))
        AircraftStateCell(aircraftState: AircraftState(from: [
            "a10f9a", "N168CB  ", "United States",
            1698763532, 1698763532, -111.8633, 41.9844,
            2286, false, 54.17, 355.64, -1.95, 0, 2423.16,
            "", false, 0
        ]))
    }
}
