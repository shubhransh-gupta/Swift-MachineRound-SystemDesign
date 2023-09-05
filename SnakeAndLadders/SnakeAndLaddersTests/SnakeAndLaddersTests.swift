//
//  SnakeAndLaddersTests.swift
//  SnakeAndLaddersTests
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import XCTest
@testable import SnakeAndLadders

final class SnakeAndLaddersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_theGameBoard() throws {
        let game = SnakeLadderGame()
        
        game.createABoard()
        
        XCTAssertEqual(game.board, TestModel().modelForBoard)
        XCTAssertEqual(game.returnTheBoard(), TestModel().modelForBoard)
        
    }
    
    func test_theSnakes() throws {
        let game = SnakeLadderGame()
        let res = game.createSnakes(finalV: 29, initial: 10)
        let res1 = game.createSnakes(finalV: 2, initial: 10)
        XCTAssertEqual(res, true)
        XCTAssertEqual(res1, false)
        XCTAssertEqual(game.snakes, TestModel().snakes)
    }
    
    func test_theLadders() throws {
        let game = SnakeLadderGame()
        let res = game.createLadders(initial: 12, finalV: 24)
        let res1 = game.createLadders(initial: 100, finalV: 24)
        XCTAssertEqual(res, true)
        XCTAssertEqual(res1, false)
        XCTAssertEqual(game.ladders, TestModel().ladders)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
