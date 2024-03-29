//
//  FirstAppUITests.swift
//  FirstAppUITests
//
//  Created by hasher on 08/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import XCTest

class FirstAppUITests: XCTestCase {
  
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()
        
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testcase1() {
        let app = XCUIApplication()
        
        //app.buttons["twoplayers"].tap()
        
        app.textFields["player1name"].tap()
        app.textFields["player1name"].typeText("shree")
        
        app.textFields["player2name"].tap()
        app.textFields["player2name"].typeText("ram")
        
        app.buttons["NEXT_BTN"].tap()
        
        
        app.buttons["rankgenbtn"].tap()
        app.buttons["rankgenbtn"].tap()
        app.buttons["gamepagenavbtn"].tap()
        
        
        app.textFields["userinput"].tap()
        app.textFields["userinput"].typeText("H")
        app.buttons["setuserinput"].tap()
        
        
        //app.staticTexts["Get as close as you can to: "].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
    
}
