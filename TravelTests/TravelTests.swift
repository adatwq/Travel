//
//  TravelTests.swift
//  TravelTests
//
//  Created by Arwa on 13/07/1444 AH.
//

import XCTest
@testable import Travel

final class TravelTests: XCTestCase {
    
    // sut stands for system under testing
    private var sut: TravelViewModel!

    override func setUpWithError() throws {
        sut = TravelViewModel()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func test_DubaiToRiyadh_returns01h55m() {
        let actual = sut.calculateJourneyDuration(origin: "Dubai", destination: "Riyadh")
        let expected = "01h 55m"
        
        XCTAssertEqual(actual, expected)
    }
    
    func test_KuwaitToRiyadh_returnsFail() {
        let actual = sut.calculateJourneyDuration(origin: "Kuwait", destination: "Riyadh")
        let expected = "01h 30m"
        
        XCTAssertEqual(actual, expected)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
