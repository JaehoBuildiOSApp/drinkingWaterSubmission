//
//  ViewController.swift
//  drinkingWaterSubmission
//
//  Created by Jaeho Jung on 10/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nicknameText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func passInformation(_ sender: UIButton) {
        performSegue(withIdentifier: "secondVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {

            //아무 값도 입력하지 않고 버튼 누르는 것을 고려하지 않고 만들면 에러 남 -> 위의 viewDidLoad에 관련 내용추가: 실패
            let heightValue = Double(heightText.text!)
            let weightValue = Double(weightText.text!)
            
            let targetAmountValue = (heightValue! + weightValue!) / 100
            destination.targetAmountValue = String(format: "%.1f", arguments: [targetAmountValue])
        }
    }
}

