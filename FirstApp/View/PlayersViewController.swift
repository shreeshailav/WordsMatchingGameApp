//
//  PlayersViewController.swift
//  FirstApp
//
//  Created by hasher on 09/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    

    
    
    @IBOutlet weak var player1btn: UIButton!
    @IBOutlet weak var player2btn: UIButton!
    @IBOutlet weak var player3btn: UIButton!
    
    @IBOutlet weak var player1name: UITextField!
    @IBOutlet weak var player2name: UITextField!
    @IBOutlet weak var player3name: UITextField!
    @IBOutlet weak var player4name: UITextField!
    
    var numberofplayer : Int = 2
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player3name.isHidden = true
        player4name.isHidden = true
        
        player1name.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)
        player2name.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)
        player3name.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)
        player4name.setBottomBorderOnlyWith(color: UIColor.gray.cgColor)

        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var playernamearray : [String] = []
        
        if !player1name.isHidden && player1name.text!.count>0 {
            //print(player1name.text!)
            playernamearray.append(player1name.text!)
        }else{
            //player1name.
        }
        if !player2name.isHidden && player2name.text!.count>0 {
            //print(player2name.text!)
            playernamearray.append(player2name.text!)
        }
        if !player3name.isHidden && player3name.text!.count>0 {
            //print(player3name.text!)
            playernamearray.append(player3name.text!)
        }
        if !player4name.isHidden && player4name.text!.count>0 {
            //print(player4name.text!)
            playernamearray.append(player4name.text!)
        }
        
        if( playernamearray.count >= 2){
            
            if let viewControllerB = segue.destination as? PSelectionViewController {
                 
                viewControllerB.playernamearray = playernamearray
                
            }
        }
    }
    
    @IBAction func playerselected(selection : UIButton){
        
        switch selection.titleLabel!.text! {
        case "2 Players":
            numberofplayer = 2
            player3name.isHidden = true
            player4name.isHidden = true
        case "3 Players":
            numberofplayer = 3
            player3name.isHidden = false
            player4name.isHidden = true
        case "4 Players":
            numberofplayer = 4
            player3name.isHidden = false
            player4name.isHidden = false
        default:
            numberofplayer = 2
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func someButtonIsClicked(_ sender: Any) {
      
        if validatefields() {
            performSegue(withIdentifier: "playerinfoview", sender: self)
        }
        
        
    }
    
    
    func validatefields() -> Bool {
        
        if(!player1name.isHidden && player1name.text!.count<=0){
            player1name.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            showToast(message: "Please Enter All Players Name")
            return false
        } else if(!player2name.isHidden && player2name.text!.count<=0){
            player2name.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            showToast(message: "Please Enter All Players Name")
            return false
        }else if(!player3name.isHidden && player3name.text!.count<=0){
            player3name.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            showToast(message: "Please Enter All Players Name")
            return false
        }else if(!player4name.isHidden && player4name.text!.count<=0){
            player4name.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            showToast(message: "Please Enter All Players Name")
            return false
        }
        
        return true
    }
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 250, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 10.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


