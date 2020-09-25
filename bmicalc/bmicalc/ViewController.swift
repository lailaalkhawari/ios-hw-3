//
//  ViewController.swift
//  bmicalc
//
//  Created by Layla alkhawari on 9/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wieghtL: UITextField!
    @IBOutlet weak var hightL: UITextField!

    @IBOutlet weak var showBMI: UILabel!
    @IBOutlet weak var showstat: UILabel!
    
    @IBOutlet weak var bg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clac(_ sender: Any) {
        
        let hight = Double(hightL.text!)
        let wieght = Double(wieghtL.text!)
        let bmi = wieght! / (hight! * hight!)
        showBMI.text = "your bmi \(bmi)"

        if bmi <= 20 {
            showstat.text = "ضعيف"
            bg.image = UIImage(named: "chops")
        }else if bmi <= 25 {
            showstat.text = "جيد"
            bg.image = UIImage(named: "good")
        }else if bmi > 25 {
            showstat.text = "سمين"
            bg.image = UIImage(named: "pandaa")
        }else{
            showstat.text = "something is wrong"
        }
           
    }
    
}

