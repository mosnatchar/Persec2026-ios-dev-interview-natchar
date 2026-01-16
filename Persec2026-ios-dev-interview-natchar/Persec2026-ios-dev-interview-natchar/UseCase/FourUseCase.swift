//
//  FourUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import Foundation
extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isDigitsOnly: Bool {
        let s = trimmed
        return !s.isEmpty && s.allSatisfy { $0.isNumber }
    }

    var isRomanOnly: Bool {
        let s = trimmed.uppercased()
        let allowed: Set<Character> = ["I","V","X","L","C","D","M"]
        return !s.isEmpty && s.allSatisfy { allowed.contains($0) }
    }
}

class FourUseCase {
    
    func intToRoman(_ num: Int) -> String {
        guard num > 0 else { return "" }

        let values: [(Int, String)] = [
            (1000, "M"),
            (900,  "CM"),
            (500,  "D"),
            (400,  "CD"),
            (100,  "C"),
            (90,   "XC"),
            (50,   "L"),
            (40,   "XL"),
            (10,   "X"),
            (9,    "IX"),
            (5,    "V"),
            (4,    "IV"),
            (1,    "I")
        ]

        var n = num
        var result = ""

        for (value, symbol) in values {
            while n >= value {
                n -= value
                result += symbol
            }
        }

        return result
    }

    
    func romanToInt(_ s: String) -> Int {
        let map: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let chars = Array(s.uppercased())
        var result = 0

        for i in 0..<chars.count {
            guard let current = map[chars[i]] else { return 0 }

            let next = (i + 1 < chars.count) ? map[chars[i + 1]] ?? 0 : 0

            if current < next {
                result -= current
            } else {
                result += current
            }
        }

        return result
    }

}
