//
//  FiveUseCaseTest.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class FiveUseCaseTest: XCTestCase {

    var sut: FiveUseCase!
    
    override func setUp() {
        super.setUp()
        sut = FiveUseCase()
    }
    
    override func tearDown() {
            sut = nil
            super.tearDown()
    }
    
    func testExamplesFromPrompt() {
        XCTAssertEqual(sut.sortDigitsDesc(3008), 8300)
        XCTAssertEqual(sut.sortDigitsDesc(1989), 9981)
        XCTAssertEqual(sut.sortDigitsDesc(2679), 9762)
        XCTAssertEqual(sut.sortDigitsDesc(9163), 9631)
    }

    func testSingleDigit() {
        XCTAssertEqual(sut.sortDigitsDesc(7), 7)
        XCTAssertEqual(sut.sortDigitsDesc(0), 0)
    }

    func testAlreadySorted() {
        XCTAssertEqual(sut.sortDigitsDesc(9876), 9876)
    }

    func testAscendingInput() {
        XCTAssertEqual(sut.sortDigitsDesc(1234), 4321)
    }

    func testWithDuplicateDigits() {
        XCTAssertEqual(sut.sortDigitsDesc(112233), 332211)
        XCTAssertEqual(sut.sortDigitsDesc(1001), 1100)
    }

    func testLargeNumber() {
        XCTAssertEqual(sut.sortDigitsDesc(9876543210), 9876543210)
    }

    func testNegativeNumberReturnsZero() {
        XCTAssertEqual(sut.sortDigitsDesc(-123), 0)
    }
}
