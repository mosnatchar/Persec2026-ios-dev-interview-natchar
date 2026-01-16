//
//  ThirstUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import Foundation
class ThirstUseCase {
    
    func autoComplete(_ search: String, _ items: [String], _ maxResult: Int) -> [String] {
        guard maxResult > 0 else { return [] }
        let q = search.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return [] }

        let qLower = q.lowercased()
        let qLen = qLower.count

        // เก็บ (rankGroup, indexFound, originalIndex, originalString)
        // rankGroup: 0 = ต้นคำ, 1 = กลางคำ, 2 = ท้ายคำ
        var matches: [(Int, Int, Int, String)] = []

        for (i, item) in items.enumerated() {
            let lower = item.lowercased()

            guard let range = lower.range(of: qLower) else { continue }

            // คำนวณ index ที่พบ (เป็น Int)
            let idxFound = lower.distance(from: lower.startIndex, to: range.lowerBound)
            let itemLen = lower.count
            let isAtStart = (idxFound == 0)
            let isAtEnd = (idxFound == itemLen - qLen)

            let group: Int
            if isAtStart { group = 0 }
            else if isAtEnd { group = 2 }
            else { group = 1 }

            matches.append((group, idxFound, i, item))
        }

        // เรียง: group ก่อน -> indexFound น้อยก่อน -> คงลำดับเดิมถ้าเท่ากัน
        matches.sort {
            if $0.0 != $1.0 { return $0.0 < $1.0 }
            if $0.1 != $1.1 { return $0.1 < $1.1 }
            return $0.2 < $1.2
        }

        return matches.prefix(maxResult).map { $0.3 }
    }

}
