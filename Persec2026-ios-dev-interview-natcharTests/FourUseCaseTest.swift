//
//  FourUseCaseTest.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest
@testable import Persec2026_ios_dev_interview_natchar

final class FourUseCaseTest: XCTestCase {
    
    // MARK: - intToRoman tests
    var sut: FourUseCase!
    
    override func setUp() {
        super.setUp()
        sut = FourUseCase()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testIntToRoman_basic() {
        XCTAssertEqual(sut.intToRoman(1), "I")
        XCTAssertEqual(sut.intToRoman(2), "II")
        XCTAssertEqual(sut.intToRoman(3), "III")
        XCTAssertEqual(sut.intToRoman(4), "IV")
        XCTAssertEqual(sut.intToRoman(5), "V")
        XCTAssertEqual(sut.intToRoman(9), "IX")
        XCTAssertEqual(sut.intToRoman(10), "X")
    }
    
    func testIntToRoman_tensHundredsThousands() {
        XCTAssertEqual(sut.intToRoman(40), "XL")
        XCTAssertEqual(sut.intToRoman(50), "L")
        XCTAssertEqual(sut.intToRoman(90), "XC")
        XCTAssertEqual(sut.intToRoman(100), "C")
        XCTAssertEqual(sut.intToRoman(400), "CD")
        XCTAssertEqual(sut.intToRoman(500), "D")
        XCTAssertEqual(sut.intToRoman(900), "CM")
        XCTAssertEqual(sut.intToRoman(1000), "M")
    }
    
    func testIntToRoman_examples() {
        XCTAssertEqual(sut.intToRoman(58), "LVIII")
        XCTAssertEqual(sut.intToRoman(1994), "MCMXCIV")
        XCTAssertEqual(sut.intToRoman(3999), "MMMCMXCIX")
    }
    
    func testIntToRoman_outOfRangeReturnsEmpty() {
        XCTAssertEqual(sut.intToRoman(0), "")
        XCTAssertEqual(sut.intToRoman(-1), "")
        XCTAssertEqual(sut.intToRoman(4000), "")
    }
    
    // MARK: - romanToInt tests
    
    func testRomanToInt_basic() {
        XCTAssertEqual(sut.romanToInt("I"), 1)
        XCTAssertEqual(sut.romanToInt("II"), 2)
        XCTAssertEqual(sut.romanToInt("III"), 3)
        XCTAssertEqual(sut.romanToInt("IV"), 4)
        XCTAssertEqual(sut.romanToInt("V"), 5)
        XCTAssertEqual(sut.romanToInt("IX"), 9)
        XCTAssertEqual(sut.romanToInt("X"), 10)
    }
    
    func testRomanToInt_examples() {
        XCTAssertEqual(sut.romanToInt("LVIII"), 58)
        XCTAssertEqual(sut.romanToInt("MCMXCIV"), 1994)
        XCTAssertEqual(sut.romanToInt("MMMCMXCIX"), 3999)
    }
    
    func testRomanToInt_ignoreCase() {
        XCTAssertEqual(sut.romanToInt("mcmxciv"), 1994)
        XCTAssertEqual(sut.romanToInt("MmMcMxCiX"), 3999)
    }
    
    func testRomanToInt_invalidCharacterReturnsZero() {
        XCTAssertEqual(sut.romanToInt("A"), 0)
        XCTAssertEqual(sut.romanToInt("XMZ"), 0)
        XCTAssertEqual(sut.romanToInt("I V"), 0) // มี space
    }
}
