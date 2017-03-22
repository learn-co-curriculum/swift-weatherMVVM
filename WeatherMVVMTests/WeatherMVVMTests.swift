//
//  WeatherMVVMTests.swift
//  WeatherMVVMTests
//
//  Created by Johann Kerr on 3/22/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import XCTest
@testable import WeatherMVVM

class WeatherMVVMTests: XCTestCase {
    
    var store: ForecastDataStore!
    var forecastViewModel: ForecastViewModel!
    
    override func setUp() {
        super.setUp()

        let exp = expectation(description: "mvvmTest")
        forecastViewModel =  {
            return ForecastViewModel(task: { [unowned self] in
                exp.fulfill()
            })
        }()

       
        
        waitForExpectations(timeout: 25) { (error) in
            if error != nil {
                
            }
            
        }
    }
    
    override func tearDown() {
        super.tearDown()
        forecastViewModel = nil
    }
    
    
    
    
    func testCurrentSummary() {
        XCTAssertTrue(forecastViewModel.currentSummary.characters.count > 0, forecastViewModel.currentSummary)
    }
    
    func testCurrentTemperature() {
        let tempInDegrees = Double(forecastViewModel.currentTemperature) ?? 0.0
        XCTAssertTrue(forecastViewModel.currentTemperature.characters.count == 2, "Current Temperature")
        XCTAssertGreaterThan(tempInDegrees, 20)
        
    }
    
    func testLowTemperature() {
        let tempInDegrees = Double(forecastViewModel.todayLowTemperature) ?? 0.0
        XCTAssertTrue(forecastViewModel.todayLowTemperature.characters.count == 2, "Current Temperature")
        XCTAssertGreaterThan(tempInDegrees, 20)
        
    }
    
    func testHighTemperature() {
        let tempInDegrees = Double(forecastViewModel.todayHighTemperature) ?? 0.0
        XCTAssertTrue(forecastViewModel.todayHighTemperature.characters.count == 2, "Current Temperature")
        XCTAssertGreaterThan(tempInDegrees, 20)
        
    }
    
    func testNumberOfRowsForDay() {
        XCTAssertGreaterThan(forecastViewModel.numberOfRowsFor(.day), 5)
        
    }
    
    func testNumberOfRowsForWeek() {
        XCTAssertGreaterThan(forecastViewModel.numberOfRowsFor(.week), 5)
    }
    
    func testNumberOfRowsForHour() {
        XCTAssertGreaterThan(forecastViewModel.numberOfRowsFor(.hour), 5)
    }
    
    func testCells() {
        XCTAssertGreaterThan(forecastViewModel.tempFor(.day, at: 0).characters.count, 2)
        XCTAssertGreaterThan(forecastViewModel.tempFor(.week, at: 0).characters.count, 2)
        XCTAssertLessThan(forecastViewModel.tempFor(.day, at: 0).characters.count, 6)
        XCTAssertLessThan(forecastViewModel.tempFor(.week, at: 0).characters.count, 4)
    }
    
    
    
    
}
