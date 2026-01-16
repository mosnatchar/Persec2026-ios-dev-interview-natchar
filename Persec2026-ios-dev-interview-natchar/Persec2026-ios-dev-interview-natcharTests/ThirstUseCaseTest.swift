//
//  ThirstUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//
import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class ThirstUseCase: XCTestCase {

    var sut: ThirstUseCase!
    
    override func setUp() {
        super.setUp()
        sut = ThirstUseCase()
    }
    
    func testExampleFromPrompt() {
        let items = ["Mother", "Think", "Worthy", "Apple", "Android"]
        let result = sut("th", items, 2)
        XCTAssertEqual(result, ["Think", "Mother"])
    }

    func testIgnoreCase() {
        let items = ["THink", "moTHer", "worTHy"]
        let result = autocomplete("Th", items, 10)
        XCTAssertEqual(result, ["THink", "moTHer", "worTHy"])
    }

    func testSortByPosition_startBeforeMiddleBeforeEnd() {
        let items = ["abcTHx", "xTHyz", "THstart", "endTH"]
        // "THstart" -> start
        // "xTHyz"   -> middle
        // "abcTHx"  -> middle (idx later than xTHyz)
        // "endTH"   -> end
        let result = autocomplete("th", items, 10)
        XCTAssertEqual(result, ["THstart", "xTHyz", "abcTHx", "endTH"])
    }

    func testMiddleSortByEarlierIndexFirst() {
        let items = ["a__th__", "_th____", "____th_"]
        // indexes: 3, 1, 4 (ทั้งหมดเป็น middle)
        let result = autocomplete("th", items, 10)
        XCTAssertEqual(result, ["_th____", "a__th__", "____th_"])
    }

    func testEndGroupComesAfterMiddle() {
        let items = ["xxthxx", "xxth", "thxx"]
        // "thxx"  -> start
        // "xxthxx"-> middle
        // "xxth"  -> end
        let result = autocomplete("th", items, 10)
        XCTAssertEqual(result, ["thxx", "xxthxx", "xxth"])
    }

    func testMaxResultLimitsOutput() {
        let items = ["Think", "Mother", "Worthy"]
        XCTAssertEqual(autocomplete("th", items, 1), ["Think"])
        XCTAssertEqual(autocomplete("th", items, 2), ["Think", "Mother"])
        XCTAssertEqual(autocomplete("th", items, 3), ["Think", "Mother", "Worthy"])
    }

    func testNoMatchReturnsEmpty() {
        let items = ["Apple", "Android"]
        let result = autocomplete("th", items, 10)
        XCTAssertEqual(result, [])
    }

    func testEmptySearchReturnsEmpty() {
        let items = ["Think", "Mother"]
        XCTAssertEqual(autocomplete("", items, 10), [])
        XCTAssertEqual(autocomplete("   ", items, 10), [])
    }

    func testMaxResultZeroOrNegativeReturnsEmpty() {
        let items = ["Think", "Mother"]
        XCTAssertEqual(autocomplete("th", items, 0), [])
        XCTAssertEqual(autocomplete("th", items, -1), [])
    }

    func testStableOrderWhenSameGroupAndSameIndex() {
        let items = ["thA", "thB", "thC"]

