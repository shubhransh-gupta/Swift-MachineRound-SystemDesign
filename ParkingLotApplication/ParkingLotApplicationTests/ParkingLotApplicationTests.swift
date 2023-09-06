//
//  ParkingLotApplicationTests.swift
//  ParkingLotApplicationTests
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import XCTest
@testable import ParkingLotApplication

final class ParkingLotApplicationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_theSpots() throws {
        let parkingLot = ParkingLot(id: "PR1234", noOfFloors: 10, noOfSlotsOnEachFloors: 10)
        let first = parkingLot.getTheSlotIfTheGivenVehicleTypeCanBeParked(vehicleType : .car)
        let ssecond = parkingLot.getTheSlotIfTheGivenVehicleTypeCanBeParked(vehicleType : .truck)
        
        XCTAssertEqual(0, ssecond.0)
        XCTAssertEqual(0, ssecond.1)
        XCTAssertEqual(0, first.0)
        XCTAssertEqual(3, first.1)
    }
    
    func test_unparkedVehicle() throws {
        let parkingLot = ParkingLot(id: "PR1234", noOfFloors: 10, noOfSlotsOnEachFloors: 10)
        let vehicle = Vehicle(type: .car, regNo: "UP32KA1234", color: .black)
        _ = parkingLot.findAndBookParkingSpotFor(vehicle: vehicle)
        
        let result = parkingLot.unParkedVehicle(ticket: "PR1234_0_3" )
        let result1 = parkingLot.unParkedVehicle(ticket: "PR1234_-14_-1" )
        XCTAssertEqual(result, ParkingTestModule().realunparkedData)
        XCTAssertEqual(result1, ParkingTestModule().UnrealunparkedData)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
