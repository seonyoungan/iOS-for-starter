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
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
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

