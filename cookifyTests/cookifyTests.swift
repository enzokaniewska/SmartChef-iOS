//
//  cookifyTests.swift
//  cookifyTests
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import XCTest
@testable import SmartChef

final class cookifyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func RecipeResponse_JsonDecoding() throws {
        let testResponse = RecipeResponse.getTestResponse()
        XCTAssert(testResponse?.title == "Tuna Rice Pilaf" )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
