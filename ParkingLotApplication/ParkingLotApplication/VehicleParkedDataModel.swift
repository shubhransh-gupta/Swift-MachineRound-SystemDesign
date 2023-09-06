//
//  VehicleParkedDataModel.swift
//  ParkingLotApplication
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import Foundation

class VehicleParked {
    var vehicle : Vehicle?
    var isParked : Bool?
    var parkingTicket : String?
    
    init(vehicle: Vehicle? = nil, isParked: Bool? = nil, parkingTicket: String? = nil) {
        self.vehicle = vehicle
        self.isParked = isParked
        self.parkingTicket = parkingTicket
    }
}
