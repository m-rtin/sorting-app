//
//  SortingTests.swift
//  SortingTests
//
//  Created by Martin Voigt on 26.10.20.
//

import XCTest
@testable import Sorting

class SortingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBubbleSort() throws {
        var testArray: [Int] = [8, 5, 2, 9, 5, 6, 3]
        let resultArray: [Int] = [5, 2, 8, 5, 6, 3, 9]
        XCTAssertTrue(bubbleSortStep(array: &testArray) == resultArray)
    }
    
    func testInsertionSort() throws {
        var testArray: [Int] = [2, 5, 5, 8, 9, 6, 3]
        let resultArray: [Int] = [2, 5, 5, 6, 8, 9, 3]
        XCTAssertTrue(insertionSortStep(array: &testArray, ptr: 5) == resultArray)
    }
    
    func testSelectionSort() throws {
        var testArray: [Int] = [8, 5, 2, 9, 5, 6, 3]
        let resultArray: [Int] = [2, 5, 8, 9, 5, 6, 3]
        XCTAssertTrue(selectionSortStep(array: &testArray, ptr: 0) == resultArray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
