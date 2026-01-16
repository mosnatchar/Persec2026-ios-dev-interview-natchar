//
//  TwoUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//
struct CodeKey: Comparable {
    let prefix: String
    let number: Int
    let suffix: String
    let original: String

    static func < (lhs: CodeKey, rhs: CodeKey) -> Bool {
        if lhs.prefix != rhs.prefix { return lhs.prefix < rhs.prefix }
        if lhs.number != rhs.number { return lhs.number < rhs.number }
        if lhs.suffix != rhs.suffix { return lhs.suffix < rhs.suffix }
        return lhs.original < rhs.original
    }
}

class SecondUseCase {
    
    func parseCode(_ s: String) -> CodeKey {
        let chars = Array(s)
        var i = 0

        // 1) prefix = ตัวอักษรนำหน้า
        while i < chars.count, chars[i].isLetter { i += 1 }
        let prefix = String(chars[0..<i])

        // 2) number = ตัวเลขที่ตามหลัง prefix (ถ้าไม่มีให้เป็น Int.max)
        var j = i
        while j < chars.count, chars[j].isNumber { j += 1 }
        let numberStr = String(chars[i..<j])
        let number = Int(numberStr) ?? Int.max

        // 3) suffix = ส่วนที่เหลือ
        let suffix = String(chars[j..<chars.count])

        return CodeKey(prefix: prefix, number: number, suffix: suffix, original: s)
    }

    func sortCodes(_ arr: [String]) -> [String] {
        return arr
            .map(parseCode)
            .sorted()
            .map { $0.original }
    }
}
