//
//  RegisterUITests.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 10/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import XCTest

class RegisterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSettingPage() {
        let app = XCUIApplication()
        
        // Tap the button
        app.buttons["Login"].tap()
        
        // Tap the Settings button on tab bar
        let tabController = app.tabBars.buttons["Settings"]
        tabController.tap()
        
        // Test that the placeholder text is what you expect
        let currentPWDTextField = app.textFields["currentPassWord"]
        XCTAssertEqual(currentPWDTextField.placeholderValue, "Current password")
        
        let newPWDTextField = app.textFields["newPassWord"]
        XCTAssertEqual(newPWDTextField.placeholderValue, "New password")
        
        let confirmPWDTextField = app.textFields["confirmPassWord"]
        XCTAssertEqual(confirmPWDTextField.placeholderValue, "Confirm password")
        
        // Test that the initial button text is what you expect
        let changePWDButton = app.buttons["changePWDButton"]
        XCTAssertEqual(changePWDButton.label, "Change your password")
            
    }
    
}
