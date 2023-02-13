//
//  TravelUITestsLaunchTests.swift
//  TravelUITests
//
//  Created by Arwa on 13/07/1444 AH.
//

import XCTest

final class TravelUITestsLaunchTests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    func test_open_JourneyDetailsView() {
        
        let GoButton = self.app.buttons["Go"]
        GoButton.tap()
    }
 
}
