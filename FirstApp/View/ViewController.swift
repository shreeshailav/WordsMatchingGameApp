//
//  ViewController.swift
//  FirstApp
//
//  Created by hasher on 08/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var rankgen: UIButton!
    @IBOutlet weak var numberofplayer: UITextField!
    @IBOutlet weak var setplayers: UIButton!
    @IBOutlet weak var playersnames: UIStackView!
    @IBOutlet weak var selectplayers: UIStackView!
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var player4: UILabel!
    
    var test : String = "shreeshail"
    
    var arrayofstruct : [PlayerInfo] = []
    var prevplayer : PlayerInfo!
    var game : Game!
    var playermove : PlayerMove!
    var previousNumber: [UInt32] = [] // used in randomNumber()
    @IBOutlet weak var currplayer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //playersnames.isHidden = true
        
        
        
    }
    @IBAction func showmessage(setplayers : UIButton){
        /*let numberifpl : String = numberofplayer.text!
        
        let uialertcontroller = UIAlertController(title: "Hashedin", message: "Number of players : \(numberifpl)", preferredStyle: UIAlertController.Style.alert)
        uialertcontroller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction) in
            self.playersnames.isHidden = false
            self.selectplayers.isHidden = true
            
            self.arrayofstruct.append(PlayerInfo(name : "A" , lifeline : 2))
            self.arrayofstruct.append(PlayerInfo(name : "B" , lifeline : 2))
            self.arrayofstruct.append(PlayerInfo(name : "C" , lifeline : 2))
            self.arrayofstruct.append(PlayerInfo(name : "D" , lifeline : 2))


            self.player1.text = self.arrayofstruct[0].name + " -> \(self.arrayofstruct[0].score)"
            self.player2.text = self.arrayofstruct[1].name + " -> \(self.arrayofstruct[1].score)"
            self.player3.text = self.arrayofstruct[2].name + " -> \(self.arrayofstruct[2].score)"
            self.player4.text = self.arrayofstruct[3].name + " -> \(self.arrayofstruct[3].score)"
            
            self.game = Game(word:"computer")
            self.game.parsedict(word:"c")
            
            self.currplayer.text = self.arrayofstruct[0].name
            self.prevplayer = self.arrayofstruct[0]
            self.playermove = PlayerMove(player : self.arrayofstruct)
            
        }))
        present(uialertcontroller,animated: true,completion: nil) */
    }
    @IBAction func setvalue(value : UIButton){
        /* let curr = self.playermove.nextmove(player: prevplayer)
        self.prevplayer = curr
        self.currplayer.text = self.prevplayer.name */
    }
    

    
    @IBAction func generaterank(generate : UIButton) {
        /* var randomNumber = arc4random_uniform(5)
        if(previousNumber.count == 0 ){
            previousNumber.append(randomNumber)
            print(previousNumber)
            self.rank.text = String(randomNumber)
        }else if(previousNumber.count < 4){
            for i in 0..<previousNumber.count {
                while previousNumber[i] == randomNumber {
                    randomNumber = arc4random_uniform(5)
                }
            }
            previousNumber.append(randomNumber)
            self.rank.text = String(randomNumber)
            
            print(previousNumber)
        } */
    }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let val = segue.destination as? PlayersViewController
        val?.ename = "shreeshail"
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if let viewControllerB = segue.destination as? PlayersViewController {
            viewControllerB.ename = "Shree"
        }*/
    }
}

