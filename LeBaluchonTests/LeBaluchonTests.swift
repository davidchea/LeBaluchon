//
//  LeBaluchonTests.swift
//  LeBaluchonTests
//
//  Created by David Chea on 30/12/2019.
//  Copyright © 2019 David Chea. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Le_Baluchon

class LeBaluchonTests: XCTestCase {
    
    // MARK: - FixerAPI
    
    func testGetRateFromEuroToDollar() {
        let expectation = XCTestExpectation(description: "testGetRateFromEuroToDollar")
        
        FixerAPI.shared.getRateFromEuroToDollar { json in
            XCTAssertNotEqual(json["rates"]["USD"], JSON.null)
            XCTAssertEqual(json["error"], JSON.null)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    // MARK: - CloudTranslationAPI
    
    func testGetTranslationToEnglish() {
        let expectation = XCTestExpectation(description: "testGetTranslationToEnglish")
        
        CloudTranslationAPI.shared.getTranslationToEnglish("Maison") { json in
            XCTAssertEqual(json["data"]["translations"][0]["translatedText"].stringValue, "House")
            XCTAssertEqual(json["error"], JSON.null)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    // MARK: - OpenWeatherAPI
    
    func testGetWeather() {
        let expectation = XCTestExpectation(description: "testGetWeather")
        
        OpenWeatherAPI.shared.getWeather("2988507,5128581") { json in
            XCTAssertNotEqual(json["list"][0]["main"]["temp"], JSON.null)
            XCTAssertNotEqual(json["list"][0]["weather"][0]["main"], JSON.null)
            
            XCTAssertNotEqual(json["list"][1]["main"]["temp"], JSON.null)
            XCTAssertNotEqual(json["list"][1]["weather"][0]["main"], JSON.null)
            
            XCTAssertEqual(json["error"], JSON.null)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
