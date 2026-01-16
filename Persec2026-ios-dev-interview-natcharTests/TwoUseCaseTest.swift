//
//  TwoUseCaseTest.swift
//  Persec2026-ios-dev-interview-natcharTests
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class TwoUseCaseTest: XCTestCase {

    var sut: SecondUseCase!
    
    override func setUp() {
        super.setUp()
        sut = SecondUseCase()
    }
    
    override func tearDown() {
            sut = nil
            super.tearDown()
    }

    func testExample1() {
           let input = ["TH19", "SG20", "TH2"]
           let expected = ["SG20", "TH2", "TH19"]
        XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testExample2() {
           let input = ["TH10", "TH3Netflix", "TH1", "TH7"]
           let expected = ["TH1", "TH3Netflix", "TH7", "TH10"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testSamePrefixSortByNumber() {
           let input = ["TH2", "TH10", "TH1", "TH19"]
           let expected = ["TH1", "TH2", "TH10", "TH19"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testDifferentPrefixSortByPrefixThenNumber() {
           let input = ["SG2", "TH1", "AA10", "AA2", "SG1"]
           let expected = ["AA2", "AA10", "SG1", "SG2", "TH1"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testSamePrefixSameNumberSortBySuffix() {
           let input = ["TH3Z", "TH3Netflix", "TH3A", "TH3"]
           let expected = ["TH3", "TH3A", "TH3Netflix", "TH3Z"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testKeepsDuplicates() {
           let input = ["TH1", "TH1", "TH2"]
           let expected = ["TH1", "TH1", "TH2"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testEmptyInput() {
           XCTAssertEqual(sut.sortCodes([]), [])
       }

       func testSingleElement() {
           XCTAssertEqual(sut.sortCodes(["TH7"]), ["TH7"])
       }

       func testNoNumberGoesLastWithinSamePrefix() {
           // ตามโค้ด parseCode: ถ้าไม่มีเลข -> number = Int.max
           let input = ["TH2", "THX", "TH1", "TH"]
           let expected = ["TH1", "TH2", "TH", "THX"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }

       func testNonStandardStartsWithNumberHandled() {
           // prefix จะเป็น "" และ number จะอ่านได้เป็น 10
           let input = ["10TH", "2TH", "TH1"]
           let expected = ["2TH", "10TH", "TH1"]
           XCTAssertEqual(sut.sortCodes(input), expected)
       }
}
