//
//  SixUseCaseTest.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class SixUseCaseTest: XCTestCase {

    var sut: SixUseCase!
    
    override func setUp() {
        super.setUp()
        sut = SixUseCase()
    }
    
    override func tearDown() {
            sut = nil
            super.tearDown()
    }

    func testExamplesFromPrompt() {
        XCTAssertEqual(sut.tribonacci([1, 3, 5], 5), [1, 3, 5, 9, 17])
        XCTAssertEqual(sut.tribonacci([2, 2, 2], 3), [2, 2, 2])
        XCTAssertEqual(sut.tribonacci([10, 10, 10], 4), [10, 10, 10, 30])
    }

    func testWhenNIsZeroOrNegative_returnsEmpty() {
        XCTAssertEqual(sut.tribonacci([1, 3, 5], 0), [])
        XCTAssertEqual(sut.tribonacci([1, 3, 5], -1), [])
    }

    func testSeedLongerThanN_isTrimmed() {
        XCTAssertEqual(sut.tribonacci([1, 2, 3, 999], 3), [1, 2, 3])
        XCTAssertEqual(sut.tribonacci([5, 6, 7, 8], 1), [5])
    }

    func testSeedLessThan3_fillsWithZerosUpTo3BeforeGenerating() {
        XCTAssertEqual(sut.tribonacci([], 1), [0])
        XCTAssertEqual(sut.tribonacci([], 3), [0, 0, 0])
        XCTAssertEqual(sut.tribonacci([], 5), [0, 0, 0, 0, 0])

        XCTAssertEqual(sut.tribonacci([1], 3), [1, 0, 0])
        XCTAssertEqual(sut.tribonacci([1], 5), [1, 0, 0, 1, 1])

        XCTAssertEqual(sut.tribonacci([1, 2], 3), [1, 2, 0])
        XCTAssertEqual(sut.tribonacci([1, 2], 6), [1, 2, 0, 3, 5, 8])
    }

    func testNormalTribonacciProgression() {
        XCTAssertEqual(sut.tribonacci([0, 0, 1], 10), [0, 0, 1, 1, 2, 4, 7, 13, 24, 44])
        XCTAssertEqual(sut.tribonacci([3, 4, 1], 6), [3, 4, 1, 8, 13, 22])
    }

    func testNegativeValuesInSeed_allowed() {
        XCTAssertEqual(sut.tribonacci([-1, 0, 1], 6), [-1, 0, 1, 0, 1, 1])
    }
}
