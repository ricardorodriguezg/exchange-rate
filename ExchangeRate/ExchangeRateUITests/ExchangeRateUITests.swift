//
//  ExchangeRateUITests.swift
//  ExchangeRateUITests
//
//  Created by Alonso Rodriguez on 19/02/22.
//

import XCTest

class ExchangeRateUITests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() throws {
        // 1
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        let welcome = app.staticTexts["Tú envías:"]
        XCTAssert(welcome.exists)
        // 4
        snapshot("01Home")
        // 5
//        app.buttons["what should i do"].tap()
//        snapshot("02Suggestion")

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
