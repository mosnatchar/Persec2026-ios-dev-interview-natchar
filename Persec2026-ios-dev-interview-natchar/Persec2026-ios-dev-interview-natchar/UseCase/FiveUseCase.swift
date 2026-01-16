//
//  FiveUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//
class FiveUseCase {
    func sortDigitsDesc(_ n: Int) -> Int {
        guard n >= 0 else { return 0 }

        let sorted = String(n)
            .sorted(by: >)               // เรียงตัวอักษร '9'..'0' ได้ตรงกับเลข
        return Int(String(sorted)) ?? 0
    }
}
