//
//  FristUseCase.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

class FristUseCase {
    
    func isValidateValue(_ value: String) -> Bool {
        var stack: [Character] = []

        let pairs: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        for check in value {
            if check == "(" || check == "[" || check == "{" {
                stack.append(check)
            }

            else if let expectedOpen = pairs[check] {
                guard let last = stack.popLast(), last == expectedOpen else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}
