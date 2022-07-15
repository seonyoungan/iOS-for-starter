//
//  ViewController.swift
//  UpDownGame
//
//  Created by 안선영 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    let literalImage: UIImage = #imageLiteral(resourceName: "slider_thumb")
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(literalImage, for: .normal)
        
    }
    
    //동작
    @IBAction func sliderValueChanged(_ sender : UISlider){
        print(sender.value)
        viewDidLoad() //literalImage가 보여짐
        let integerVlaue: Int = Int(sender.value)

        sliderValueLabel.text = String(sender.value)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default){
            (action) in self.reset()
        }//버튼 하나하나
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue) //사용자가 잡아끄는 값을 정밀하게 표현
        tryCount = tryCount + 1
        tryCountLabel.text =
        "\(tryCount) / 5"
        
        if randomValue == hitValue{ // 맞추면 HIT, 게임종료
            print("YOU HIT!")
            reset() //게임 초기화
        } else if tryCount >= 5{ //5회이상 선택시 게임종료
            print("YOU Lose..")
            reset()
        } else if randomValue > hitValue { //사용자가 선택한 숫자에 따라 minimum, maximum 범위 바꿔주기
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else if randomValue < hitValue{ //사용자가 선택한 숫자에 따라 minimum, maximum 범위 바꿔주기
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button!")
        reset()
    }
    
    func reset(){
        print("reset!")
        //임의의 정수 만드는 코드 만들기
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = " 0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value =  15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }
}

