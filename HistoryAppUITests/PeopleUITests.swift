//
//  HistoryAppUITests.swift
//  HistoryAppUITests
//
//  Created by Jiongyan Zhang on 28/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import XCTest

class HistoryAppUITests: XCTestCase {
        
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
        
//        XCUIApplication().terminate()
    }
    
    func testLoginPage() {
        let app = XCUIApplication()
        
        // Test that there is only 1 image dispayed on the view
        XCTAssertEqual(app.images.count, 1)
        
        // Test that there are 2 testFields on the view
        XCTAssertEqual(app.textFields.count, 2)
        
        // Test that the initial textFields placeholder value is what you expect
        let emailTextField = app.textFields["EmailTextField"]
        XCTAssertEqual(emailTextField.placeholderValue, "Email")
        
        let passwordTextField = app.textFields["PasswordTextField"]
        XCTAssertEqual(passwordTextField.placeholderValue, "Password")
        
        // Test that the initial button text is what you expect
        let registerButton = app.buttons["RegisterButton"]
        XCTAssertEqual(registerButton.label, "Register")
        
        let loginButton = app.buttons["LoginButton"]
        XCTAssertEqual(loginButton.label, "Login")

    }
    
    func testPeoplePage() {
        let app = XCUIApplication()
        
        // Tap the button
        app.buttons["Login"].tap()
        
        // Test that there is 1 Search Bar on the view
        let searchBarCount = app.searchFields.count
        XCTAssertEqual(searchBarCount, 1)
        
        //Test that the text of the first cell
        XCTAssertEqual(app.tables.count, 1) //one tableview
        
        let tableView = app.tables.elementBoundByIndex(0)
        XCTAssertTrue(tableView.exists)
        XCTAssertEqual(tableView.cells.count, 5)    //5 cells on tableview
        
        let cell = tableView.cells.elementBoundByIndex(0)   //first cell
        XCTAssertTrue(cell.exists)
        
        //Test that the first cell's text is "Li Qingzhao"
        XCTAssertEqual(cell.staticTexts.elementBoundByIndex(0).label, "Li Qingzhao")
        
        //Test that the first cell's sub title is "A talented female poet"
        XCTAssertEqual(cell.staticTexts.elementBoundByIndex(1).label, "A talented female poet")
        
        //Test that the second cell's text and sub title are different from the first cell's
        let secondCell = tableView.cells.elementBoundByIndex(1)
        XCTAssertNotEqual(secondCell.staticTexts.elementBoundByIndex(0).label, "Li Qingzhao")
        XCTAssertNotEqual(secondCell.staticTexts.elementBoundByIndex(1).label, "A talented female poet")
        
    }
    
    func testDetailPage() {
        let app = XCUIApplication()
        
        // Tap the button
        app.buttons["Login"].tap()
        
        // Tap the cell
        app.tables.elementBoundByIndex(0).staticTexts["Li Qingzhao"].tap()

        // Test that the detail image exists on the view
        let detailView = app.images["detailImageView"]
        XCTAssertTrue(detailView.exists)
        
        // Test that the initial textview text is what you expect
        let textViewText = app.textViews.element.value as? String
        XCTAssertEqual(textViewText, "Li Qingzhao was born 1084 in Zhangqiu (modern Shandong province) into a family of scholar-officials. Her father was a student of Su Shi. He had a large collection of books and Li was educated during her childhood. She was unusually outgoing and knowledgeable for a woman of noble birth.Li Qingzhao was born 1084 in Zhangqiu (modern Shandong province) into a family of scholar-officials. Her father was a student of Su Shi. He had a large collection of books and Li was educated during her childhood. She was unusually outgoing and knowledgeable for a woman of noble birth.Before she got married, her poetry was already well known within elite circles. In After he started his official career, her husband was often absent.")
        
        // Test the dismiss tap
        let dismissButton = app.buttons["dismissButton"]
        dismissButton.tap()
        
        // Tap the cell
        app.tables.elementBoundByIndex(0).staticTexts["Li Qingzhao"].tap()

        // Test the Wiki button
        let wikiButton = app.buttons["wikiButton"]
        XCTAssertEqual(wikiButton.label, "Wiki")
        wikiButton.tap()
        
    }
}
