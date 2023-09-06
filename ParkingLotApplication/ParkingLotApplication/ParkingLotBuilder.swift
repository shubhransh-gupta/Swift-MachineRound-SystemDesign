//
//  ParkingLotBuilder.swift
//  ParkingLotApplication
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import Foundation


protocol ParkingTickets {
    func generateTicket(vehicle : Vehicle, parkingSpot : (Int, Int)) -> String
    func unParkedVehicle(ticket : String) -> String
}

protocol DisplayOperations : AnyObject {
    func displayfreeslot(vehicleType : Vehicletype)
    func displayFreeFloorsAndSlots(vehicleType : Vehicletype)
    func displayOccupiedSlots(vehicleType : Vehicletype)
}

class ParkingLot {
    
    var id : String?
    var noOfFloors : Int? = 0
    var noOfSlotsOnEachFloors : Int? = 0
    var parkingArray = [[VehicleParked?]]()
    
    init(id: String? = nil, noOfFloors: Int? = nil, noOfSlotsOnEachFloors: Int? = nil) {
        self.id = id
        self.noOfFloors = noOfFloors
        self.noOfSlotsOnEachFloors = noOfSlotsOnEachFloors
        parkingArray = Array(repeating: Array<VehicleParked?>(repeating: nil, count: noOfSlotsOnEachFloors!), count: noOfFloors!)
        print("Created parking lot with \(noOfFloors!) floors and \(noOfSlotsOnEachFloors!) slots per floor")
    
    }
    
}

extension ParkingLot : ParkingTickets {
    
    func generateTicket(vehicle : Vehicle, parkingSpot : (Int, Int)) -> String {
        let ticket = self.id! + "_" + "\(parkingSpot.0)" + "_" + "\(parkingSpot.1)"
        return ticket
    }
    
    func findAndBookParkingSpotFor(vehicle : Vehicle) -> String {
        let parkingSpot = getTheSlotIfTheGivenVehicleTypeCanBeParked(vehicleType: vehicle.type!)
        guard parkingSpot.0 != -1 && parkingSpot.1 != -1 else {
            return "Parking Lot Full"
        }
        let ticket = generateTicket(vehicle: vehicle, parkingSpot: parkingSpot)
        parkingArray[parkingSpot.0][parkingSpot.1] = VehicleParked(vehicle: vehicle,isParked: true,parkingTicket: ticket)
        return "Parked vehicle. Ticket ID: \(ticket)"
    }
    
    func getTheSlotIfTheGivenVehicleTypeCanBeParked(vehicleType : Vehicletype) -> (Int,Int) {
        var sloti : Int = 0
        var slotj : Int = 0
        switch vehicleType {
        case .truck :
            for i in 0..<parkingArray.count {
                if parkingArray[i][0] == nil || parkingArray[i][0]?.isParked == false {
                    sloti = i
                    slotj = 0
                    break
                }
            }
        case .bike :
            for i in 0..<parkingArray.count {
                if parkingArray[i][1] == nil || parkingArray[i][1]?.isParked == false {
                    sloti = i
                    slotj = 1
                    break
                } else if parkingArray[i][2] == nil || parkingArray[i][2]?.isParked == false {
                    sloti = i
                    slotj = 2
                    break
                }
            }
        case .car :
            for i in 0..<parkingArray.count {
                for j in 0..<parkingArray[i].count {
                    if parkingArray[i][j] == nil || parkingArray[i][j]?.isParked == false {
                        sloti = i
                        slotj = j
                        break
                    }
                }
            }
        default:
            return (-1,-1)
        }
        return (sloti,slotj)
    }
}

extension ParkingLot {
    
    func unParkedVehicle(ticket: String) -> String {
      
        let ticketArray = ticket.components(separatedBy: "_")
        let floor = Int(ticketArray[1]) ?? -1
        let spot = Int(ticketArray[2]) ?? -1
        guard floor != -1 && spot != -1 else {
            return "Invalid Ticket"
        }
        if let place = self.parkingArray[floor][spot], place.isParked! {
            parkingArray[floor][spot] = nil
            return "Unparked vehicle with Registration Number: \(place.vehicle?.registrationNumber) and Color: \(place.vehicle?.color)"
        }
        return "Invalid Ticket"
    }
    
   
}

extension ParkingLot : DisplayOperations {
    func displayFreeFloorsAndSlots(vehicleType : Vehicletype) {
        _ = getTheCountFor(vehicleType: vehicleType, isfilledSlot: false)
//        _ = getTheCountFor(vehicleType: .car, isfilledSlot: false)
//        _ = getTheCountFor(vehicleType: .truck, isfilledSlot: false)
    }
    
    func displayfreeslot(vehicleType : Vehicletype) {
        _ = getTheCountFor(vehicleType: vehicleType, isfilledSlot: true, isTotalNumberAsked : true)
//        _ = getTheCountFor(vehicleType: .car, isfilledSlot: true, isTotalNumberAsked : true)
//        _ = getTheCountFor(vehicleType: .truck, isfilledSlot: true, isTotalNumberAsked : true)
    }
    
    func displayOccupiedSlots(vehicleType : Vehicletype) {
        _ = getTheCountFor(vehicleType: vehicleType, isfilledSlot: true)
//        _ = getTheCountFor(vehicleType: .car, isfilledSlot: true)
//        _ = getTheCountFor(vehicleType: .truck, isfilledSlot: true)
    }
    
    func getTheCountFor(vehicleType : Vehicletype, isfilledSlot : Bool, isTotalNumberAsked : Bool = false) -> (Int, Int) {
        var freeSlot : Int = 0
        var freeSlotString = ""
        var filledSlot : Int = 0
        var filledSlotString = ""
        switch vehicleType {
        case .car:
            for i in 0..<parkingArray.count {
                for j in 0..<parkingArray[i].count {
                    if parkingArray[i][j] == nil || parkingArray[i][j]?.isParked == false {
                        freeSlot += 1
                        freeSlotString += "\(j)" + ","
                    } else {
                        filledSlot += 1
                        filledSlotString += "\(j)" + ","
                    }
                    if j == parkingArray[i].count-1 && isTotalNumberAsked {
                        print("No. of free slots for \(Vehicletype.car.rawValue) on Floor \(i) : \(freeSlot).")
                    } else if j == parkingArray[i].count-1 && isfilledSlot {
                        print("Occupied slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(filledSlotString) ")
                    } else if j == parkingArray[i].count-1 && !isfilledSlot {
                        print("Free slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(freeSlotString) ")
                    }
                }
            }
        case .bike:
            var fallsOnBlog : Int = 0
            for i in 0..<parkingArray.count {
                for _ in 0..<parkingArray[i].count {
                    if parkingArray[i][1] == nil || parkingArray[i][1]?.isParked == false {
                        freeSlot += 1
                        freeSlotString += "1" + ","
                        fallsOnBlog = 1
                    } else if parkingArray[i][2] == nil || parkingArray[i][2]?.isParked == false {
                        freeSlot += 1
                        freeSlotString += "2" + ","
                        fallsOnBlog = 2
                    } else {
                        filledSlot += 1
                        filledSlotString += "\(fallsOnBlog)" + ","
                    }
                    if isTotalNumberAsked {
                        print("No. of free slots for \(Vehicletype.car.rawValue) on Floor \(i) : \(freeSlot).")
                    } else if isfilledSlot {
                        print("Occupied slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(filledSlotString) ")
                    } else if !isfilledSlot {
                        print("Free slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(freeSlotString) ")
                    }
                }
            }
        case .truck:
            for i in 0..<parkingArray.count {
                if parkingArray[i][0] == nil || parkingArray[i][0]?.isParked == false {
                    freeSlot += 1
                    freeSlotString += "0" + ","
                } else {
                    filledSlot += 1
                    filledSlotString += "0" + ","
                }
                if isTotalNumberAsked {
                    print("No. of free slots for \(Vehicletype.car.rawValue) on Floor \(i) : \(freeSlot).")
                } else if isfilledSlot {
                    print("Occupied slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(filledSlotString) ")
                } else if !isfilledSlot {
                    print("Free slots for \(Vehicletype.car.rawValue)  on Floor \(i): \(freeSlotString) ")
                }
            }
        default:
            return (freeSlot,filledSlot)
        }
        return (freeSlot,filledSlot)
    }
    
}
