//
//  ViewController.swift
//  UpDownGame
//
//  Created by 안선영 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider : UISlider!
    let literalImage: UIImage = #imageLiteral(resourceName: "slider_thumb")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(literalImage, for: .normal)
    }
    
    //동작
    @IBAction func sliderValueChanged(_ sender : UISlider){
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        print("touch up reset button!")
    }


}

