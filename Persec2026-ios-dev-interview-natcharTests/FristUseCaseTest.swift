//
//  FristUseCaseTest.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class BracketsValidatorTests: XCTestCase {

    var sut: FristUseCase!
    
    override func setUp() {
        super.setUp()
        sut = FristUseCase()
    }
    
    override func tearDown() {
            sut = nil
            super.tearDown()
    }

    
    func testValidCases() {
        XCTAssertTrue(sut.isValidateValue("()"))
        XCTAssertTrue(sut.isValidateValue("[]"))
        XCTAssertTrue(sut.isValidateValue("{}"))
        XCTAssertTrue(sut.isValidateValue("({})"))
        XCTAssertTrue(sut.isValidateValue("([])"))
        XCTAssertTrue(sut.isValidateValue("{[()]}"))
        XCTAssertTrue(sut.isValidateValue(""))
    }

    func testInvalidCases() {
        XCTAssertFalse(sut.isValidateValue("("))
        XCTAssertFalse(sut.isValidateValue("]"))
        XCTAssertFalse(sut.isValidateValue("([)"))
        XCTAssertFalse(sut.isValidateValue("([)]"))
        XCTAssertFalse(sut.isValidateValue("([]"))
        XCTAssertFalse(sut.isValidateValue("([{])}"))
        XCTAssertFalse(sut.isValidateValue("())"))
        XCTAssertFalse(sut.isValidateValue("{[()}]"))
    }

    func testLongMixedCases() {
        XCTAssertTrue(sut.isValidateValue("(((())))"))
        XCTAssertTrue(sut.isValidateValue("({[]})({[]})"))
        XCTAssertFalse(sut.isValidateValue("({[]})({[}])"))
        XCTAssertFalse(sut.isValidateValue("(((((((()"))
    }
}
