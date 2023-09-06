//
//  ViewController.swift
//  ParkingLotApplication
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import UIKit

class ViewController: UIViewController {

    let parkingLot = ParkingLot(id:"PR1234", noOfFloors: 2, noOfSlotsOnEachFloors: 6)
    let vehicle1 = Vehicle(type: .bike, regNo: "UP32KA4545", color: .black)
    let vehicle2 = Vehicle(type: .car, regNo: "KA02KA2233", color: .black)
    let vehicle4 = Vehicle(type: .car, regNo: "KA02KA2223", color: .blue)
    let vehicle3 = Vehicle(type: .truck, regNo: "KA05KE1234", color: .blue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parkingLot.displayFreeFloorsAndSlots(vehicleType: .truck)
        parkingLot.displayOccupiedSlots(vehicleType: .truck)
        parkingLot.displayfreeslot(vehicleType: .truck)
        
        print(parkingLot.findAndBookParkingSpotFor(vehicle: vehicle1))
        print(parkingLot.findAndBookParkingSpotFor(vehicle: vehicle2))
        print(parkingLot.findAndBookParkingSpotFor(vehicle: vehicle3))
        print(parkingLot.findAndBookParkingSpotFor(vehicle: vehicle4))
        
        parkingLot.displayFreeFloorsAndSlots(vehicleType: .truck)
        parkingLot.displayOccupiedSlots(vehicleType: .truck)
        parkingLot.displayfreeslot(vehicleType: .truck)
        parkingLot.displayOccupiedSlots(vehicleType: .car)
        parkingLot.displayfreeslot(vehicleType: .car)
        
        print(parkingLot.unParkedVehicle(ticket: "PR1234_0_0"))
        print(parkingLot.unParkedVehicle(ticket: "PR1234_0_2"))
        
        parkingLot.displayFreeFloorsAndSlots(vehicleType: .truck)
        parkingLot.displayOccupiedSlots(vehicleType: .car)
        parkingLot.displayfreeslot(vehicleType: .car)
        parkingLot.displayOccupiedSlots(vehicleType: .bike)
        parkingLot.displayfreeslot(vehicleType: .bike)
        // Do any additional setup after loading the view.
    }


}




