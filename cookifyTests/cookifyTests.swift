//
//  cookifyTests.swift
//  cookifyTests
//
//  Created by Enzo Kaniewska on 15.01.23.
//

import XCTest
@testable import SmartChef

final class cookifyTests: XCTestCase {

    
    func RecipeResponse_JsonDecoding() throws {
        let testResponse = RecipeResponse.getTestResponse()
        XCTAssert(testResponse?.name == "Tuna Rice Pilaf" )
    }
    
    func loadingLocalNutritionData() throws {
        let modelData = ModelData()
        XCTAssertNotNil(modelData.nutritionList["Apple, fresh"])
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
