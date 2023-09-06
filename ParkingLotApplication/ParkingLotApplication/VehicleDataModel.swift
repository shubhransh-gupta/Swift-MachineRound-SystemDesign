//
//  VehicleDataModel.swift
//  ParkingLotApplication
//
//  Created by Shubhransh Gupta on 05/09/23.
//
import Foundation
import UIKit

enum Vehicletype : String, CaseIterable {
    case none = "none"
    case car = "car"
    case bike = "bike"
    case truck = "truck"
}

class Vehicle {
    var isVehicleParked : Bool = false
//    var parkingTicket : String?
    
    var type : Vehicletype?
    var registrationNumber : String?
    var color : UIColor?
    
    init(type : Vehicletype, regNo : String, color : UIColor) {
        self.color = color
        self.registrationNumber = regNo
        self.type = type
    }
}

//class Truck : Vehicle {
//
//}
//
//class Car : Vehicle {
//
//}
//
//class Bikes : Vehicle {
//
//}
