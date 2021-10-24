//
//  SecondViewController.swift
//  drinkingWaterSubmission
//
//  Created by Jaeho Jung on 10/24/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var intakeAmountLabel: UILabel!
    @IBOutlet weak var targetAmountLabel: UILabel!
    @IBOutlet weak var ratioIntakeToTargetLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var drinkingAmountText: UITextField!
    
    var targetAmountValue: String?
    let imageNames = ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetAmountLabel.text = "목표량: " + targetAmountValue! + "L"
    }
    
    func presentImage(arg waterIntakeIndex: Int) {
        image.image = UIImage(named: imageNames[waterIntakeIndex])
    }
    
    //목표량을 처음에 입력할 때보다 어려움: Int(intakeAmountLabel.text!) == nil 이런 식으로 할 때, 라벨에 입력할 수 있는 값 형태에 제약이 생김 -> 내가 같이 표시하고 싶은 값을 따로 라벨을 만들어서 표시하도록 하는 등으로 해결해야 함: 이렇게 하니 작업량이 더 많아지는 것 같고, 화면 구성도 복잡해지는 느낌인데, 방법 고민해 볼 것
    //아래 조건문에서 let targetValue~ 는 if, else에서 반복되는데, 이걸 조건문에서 뺄 경우 값을 못읽어 옴. 이 부분은 함수로 만들고 함수를 실행시키는 것으로 바꿔도 될 것 같음
    //초기화 못만들었음
    //매일의 목표달성률을 기록으로 따로 남기면 좋을 듯: 시각화 등도 고려해 볼 것
    //이렇게 하면, 초기 이미지를 비우게 되는데, 일단 이 정도로만 하고 나중에 생각할 것
    //xcode12.4에서는 앱 화면 녹화 기능 없고, xcode12.5는 설치가 안됨: xcode12.5beta3 설치해 볼 것
    
    @IBAction func drinkgAmountEnterButton(_ sender: UIButton) {
        if Int(intakeAmountLabel.text!) == nil {
            let intakeAmountValue = drinkingAmountText.text
            intakeAmountLabel.text = intakeAmountValue!
            let ratioIntakeToTargetValue = (Double(Double(intakeAmountValue!)! / 10) / Double(targetAmountValue!)!)
            ratioIntakeToTargetLabel.text = ", 목표 달성률: " + String(format: "%.1f", arguments: [ratioIntakeToTargetValue]) + "%"
            let targetValueToIndex = ratioIntakeToTargetValue / 20
            if targetValueToIndex < 5 {
                image.image = UIImage(named: imageNames[Int(targetValueToIndex)])
            } else if targetValueToIndex < 11 {
                image.image = UIImage(named: imageNames[5])
            } else {
                image.image = UIImage(named: imageNames[6])
            }
         } else {
            let previousNumber = Int(intakeAmountLabel.text!)!
            let newNumber = Int(drinkingAmountText.text!)
            let intakeAmountValue = previousNumber + newNumber!
            intakeAmountLabel.text = String(intakeAmountValue)
            let ratioIntakeToTargetValue = (Double(Double(intakeAmountValue) / 10) / Double(targetAmountValue!)!)
            ratioIntakeToTargetLabel.text = ", 목표 달성률: " + String(format: "%.1f", arguments: [ratioIntakeToTargetValue]) + "%"
            let targetValueToIndex = ratioIntakeToTargetValue / 20
            if targetValueToIndex < 5 {
                image.image = UIImage(named: imageNames[Int(targetValueToIndex)])
            } else if targetValueToIndex < 11 {
                image.image = UIImage(named: imageNames[5])
            } else {
                image.image = UIImage(named: imageNames[6])
            }
        }
    }
}

//작업 과정 요약
//1. 첫 번째 vc에서 두 번째 vc로 입력값 옮겨주고, 화면에 띄우기
//2. 첫 번째 vc에서 두 번째 vc로 목표값 입력하고, 그 아래에 물 마신 양 입력 가능하게 하기
//2-1. 물 마신 양이 계속해서 더해지도록 하고, 그 값 표시하기
//3. 첫 번째 화면에서 키, 몸무게 입력하고, 그 값을 목표값으로 설정하고, 그 값을 두 번째 vc로 옮기고, 1~2-1.기능 되게 하기
//4. 목표 달성률에 따라 이미지 바뀌게 하기

//나중에 더 해 볼 것
//5. 텍스트 필드에 밑줄 보이게 하기
//6. 매일 목표 달성 여부 따로 모아보게 하기
//7. 앱 가진 사람들끼리 친구 추가하고, 목표 달성 여부 보이게 하기
//7-1. 목표 달성을 위해 친구끼리 격려하기 메시지 보내기 기능 추가
//8. 물, 음료수 사먹을 수 있게 기프티콘 선물하기


/*
선생님들께

제가 깃을 아직 잘 이해를 못해서..^^;;
늦어서 죄송합니다.
시간 관리 더 잘 하고, 부지런하게 따라가겠습니다.

정재호 드림
*/
