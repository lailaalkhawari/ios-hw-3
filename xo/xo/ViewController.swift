//
//  ViewController.swift
//  xo
//
//  Created by Layla alkhawari on 9/26/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var showO: UILabel!
    @IBOutlet weak var showx: UILabel!
    
    var music = AVAudioPlayer()
    
  var scoreX:Int = 0
  var scoreO:Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do{
            music = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "kahoot", ofType: "mp3")!))
        } catch {
            print(error)
        }
        
    }
    
    
    @IBAction func playb(_ sender: Any) {
        music.play()
    }
    
   
    
    
    
    var counter = 0
    @IBAction func press(_ sender: UIButton) {
     
        
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.darkGray, for: .normal)
            label1.text = "O's Turn"
        }else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.systemPink, for: .normal)
            label1.text = "X's turn"
            
        }
        counter += 1
        sender.isEnabled = false
        
        whoWon(winner: "X")
        whoWon(winner: "O")
    }
    
    func whoWon(winner: String)  {
        if (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
        (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
        (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
        (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
        (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
        (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
        (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
     (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {

            let alertControler = UIAlertController(title: "\(winner) has won the game!!!", message: "press restart to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart", style: .default) { [self] (alert) in
                self.restGame()
                
            
            }
            alertControler.addAction(restartAction)
            present(alertControler, animated: true, completion: nil)
            
            if winner == "X"{
                scoreX += 1
                showx.text = "\(scoreX)"
            }else if winner == "O"{
                scoreO += 1
                showO.text = "\(scoreO)"
            }
          
        }
    }
    

   
    func restGame(){
        let buttons: [UIButton] = [b1,b2,b3,b4,b5,b6,b7,b8,b9]
        for button in buttons{
            button.setTitle("", for: .normal)
            button.titleLabel?.text = ""
            button.isEnabled = true
            counter = 0
            label1.text = "X's turn"
        }
        
      }
    
    var counter2 = 0
    @IBAction func restart(_ sender: Any) {
        restGame()
        // bounus: change the bg color everytime you press restars button :p
        if counter2 == 0 {
            view.backgroundColor = UIColor.gray
        }else{
            view.backgroundColor = UIColor.white
            
            counter2 = 0
            return
        }
        
        counter2 += 1
    }
            

    
    //copied from the slides
//    func okAlert(title: String, message: String)
//    {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ok", style: .cancel)
//        alertController.addAction(okAction)
//        present(alertController, animated: true)
//    }
//
//
// }
            
    }

