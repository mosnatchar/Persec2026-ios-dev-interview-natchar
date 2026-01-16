//
//  SixUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

class SixUseCase {
    func tribonacci(_ seed: [Int], _ n: Int) -> [Int] {
        guard n > 0 else { return [] }

        // เอาค่าเริ่มต้นมาเท่าที่ n ต้องการ
        var result = Array(seed.prefix(n))

        // ถ้าค่าเริ่มต้นมีน้อยกว่า 3 ตัว ให้เติม 0 จนถึง 3 (แต่ไม่เกิน n)
        let targetBase = min(3, n)
        while result.count < targetBase {
            result.append(0)
        }

        // สร้างต่อจนได้ครบ n ตัว โดยเอา 3 ตัวท้ายมาบวกกัน
        while result.count < n {
            let start = max(0, result.count - 3)
            let next = result[start..<result.count].reduce(0, +)
            result.append(next)
        }

        return result
    }

}
