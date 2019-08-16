//
//  PSelectionViewController.swift
//  FirstApp
//
//  Created by hasher on 09/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class PSelectionViewController: UIViewController {
    
    @IBOutlet weak var playername: UILabel!
    @IBOutlet weak var rankbtn: UIButton!
    @IBOutlet weak var ranklabel: UILabel!
    var playernamearray : [String] = []
    
    var j : Int = 0
    
    var previousNumber: [UInt32] = []
    
    var playerinfo : [PlayerInfo] = []
    
    var currentplayerinfo : PlayerInfo!
    
    var numberofplayer : Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<playernamearray.count{
            playerinfo.append(PlayerInfo(name : playernamearray[i] , lifeline : 2))
        }
        //print(playerinfo)
        currentplayerinfo = playerinfo[j]
        playername.text = playernamearray[j]
        numberofplayer = playernamearray.count
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func generaterank(generate : UIButton) {
        var randomNumber = arc4random_uniform(UInt32(numberofplayer))
        if(previousNumber.count == 0 ){
            previousNumber.append(randomNumber)
           
            
            playerinfo[j].updaterank(rank: Int(randomNumber)+1)
            self.ranklabel.text = playerinfo[j].name+" "+String(playerinfo[j].rank)
            j = j+1
            
            /*if j<playerinfo.count {
                currentplayerinfo = playerinfo[j]
                playername.text = currentplayerinfo.name
            }*/
            
        }else if(previousNumber.count < numberofplayer ){
            
            
            /*for i in 0..<previousNumber.count {
                while previousNumber[i] == randomNumber {
                    randomNumber = arc4random_uniform(UInt32(numberofplayer))
                }
            }*/
            
            while previousNumber.contains(randomNumber){
                randomNumber = arc4random_uniform(UInt32(numberofplayer))
            }
            
            previousNumber.append(randomNumber)
            
            
            
            if j<playerinfo.count{
                playerinfo[j].updaterank(rank: Int(randomNumber)+1)
                self.ranklabel.text = self.ranklabel.text!+"\n"+playerinfo[j].name+" "+String(playerinfo[j].rank)
                j = j+1
            }
            
            
            
            /*if j<playerinfo.count {
                currentplayerinfo = playerinfo[j]
                playername.text = currentplayerinfo.name
            }*/
            
            
            //print(previousNumber)
            
            
            
        }
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let viewControllerC = segue.destination as? GameViewController {
            print(playerinfo)
            viewControllerC.playerinfo = playerinfo
            
        }
    }
    

    

}
