//
//  ViewController.swift
//  Persec2026-ios-dev-interview-natchar
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fristInput: UITextField!
    @IBOutlet weak var fristAnswer: UILabel!
    
    @IBOutlet weak var fourInput: UITextField!
    @IBOutlet weak var fourAnswer: UILabel!
    
    var vmFrist = FristUseCase()
    var vmFour = FourUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fristAction(_ sender: Any) {
        fristAnswer.text = "คำตอบ: \(vmFrist.isValidateValue(fristInput.text ?? ""))"
    }
    
    @IBAction func fourAction(_ sender: Any) {
        let input = fourInput.text?.trimmed ?? ""

        if input.isDigitsOnly, let number = Int(input), number > 0 {
            fourAnswer.text = "ตัวเลขไปโรมัน: \(vmFour.intToRoman(number))"
        } else if input.isRomanOnly {
            fourAnswer.text = "โรมันไปตัวเลข: \(vmFour.romanToInt(input))"
        } else {
            fourAnswer.text = "กรุณากรอกเป็นตัวเลข (เช่น 1994) หรือ Roman (เช่น MCMXCIV)"
        }
        
    }
    
    func fristInputAction(_ item: String) {
        var logic = FristUseCase()
        print("ผลลัพธ์ข้อ 1: \(logic.isValidateValue(item))")
    }
    
    func secondInputAction(_ item: [String]) {
        var logic = SecondUseCase()
        print("ผลลัพธ์ข้อ 2: \(logic.sortCodes(item))")
    }
    
    func ThirstInputAction(_ search: String, _ item: [String],_ maxResult: Int) {
        var logic = ThirstUseCase()
        print("ผลลัพธ์ข้อ 3: \(logic.autoComplete(search, item, maxResult))")
    }
    
    func FourInputAction(_ item: Int) {
        var logic = FourUseCase()
        let roman = logic.intToRoman(item)
        print("ผลลัพธ์ข้อ 4 ตัวเลขไปโรมัน: \(roman)")
        print("ผลลัพธ์ข้อ 4 โรมันไปตัวเลข: \(logic.romanToInt(roman))")
    }
    
    func FiveInputAction(_ item: Int) {
        var logic = FiveUseCase()
        print("ผลลัพธ์ข้อ 5: \(logic.sortDigitsDesc(item))")
    }
    
    func SixInputAction(_ seed: [Int], _ number: Int) {
        var logic = SixUseCase()
        print("ผลลัพธ์ข้อ 6: \(logic.tribonacci(seed, number))")
    }
}

