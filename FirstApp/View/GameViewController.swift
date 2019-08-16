//
//  GameViewController.swift
//  FirstApp
//
//  Created by hasher on 09/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)

    
    @IBOutlet var myBlueSubview: UIView!
    @IBOutlet weak var resultstring: UILabel!
    
    @IBOutlet weak var inputstring: UITextField!
    @IBOutlet weak var playername: UILabel!
    @IBOutlet weak var tableviewplayer: UITableView!
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "CustomTableViewCell"
    
    var playermove : PlayerMove?
    var currentplayer : PlayerInfo?
    var gameplay : GameLogic?

    
    
    //tableView.dataSource = self
    
    private var data: [String] = []
    
    
    
    var playerinfo : [PlayerInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(playerinfo)
        
        playerinfo.sort{ $0.rank > $1.rank }
        playermove = PlayerMove(player: playerinfo)
        currentplayer = playermove!.nextmove(rank: 1,players: playerinfo)
        playername.text = currentplayer?.name
        
        inputstring.delegate = self
        
        gameplay = GameLogic()
        
        // set up activity indicator
        activityIndicator.center = CGPoint(x: myBlueSubview.bounds.size.width/2, y: myBlueSubview.bounds.size.height/2)
        activityIndicator.color = UIColor.red
        myBlueSubview.addSubview(activityIndicator)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return data.count
        
        return playerinfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let customecell : CustomTableViewCell = self.tableviewplayer.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomTableViewCell
        
       
        customecell.playername?.text = self.playerinfo[indexPath.row].name
        customecell.playerscore?.text = String(self.playerinfo[indexPath.row].score)
        customecell.playerlifeline?.text = String(self.playerinfo[indexPath.row].lifeline)
        customecell.playerstatus?.text = String(self.playerinfo[indexPath.row].rank)
    
        return customecell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    @IBAction func nextplayer(selectplayer : UIButton) {
        //activityIndicator.startAnimating()
        //DispatchQueue.main.async() {
            self.play()
        //}
        
        
        
    }
    
    func play(){
        if self.inputstring.text != nil && self.inputstring.text!.count>0{
            
            
            
            if playerinfo.firstIndex(where: { $0.lifeline > 0 }) != nil {
                let result = gameplay?.checkmatches(player: currentplayer!, char: Character(inputstring.text!))
                
                currentplayer = playermove?.nextmove(rank: currentplayer!.rank,players: playerinfo)
                playername.text = currentplayer?.name
                
                //playerinfo[2].score = 4
                //refresh()
                
                let found = result!["found"] as! Bool
                
                
                
                if found {
                    // clearing text field
                    if resultstring.text == "Enter Your First Char Below"{
                        resultstring.text = ""
                    }
                    resultstring.text?.append(inputstring.text!)
                    inputstring.text = ""
                    
                    let isfullword = result!["fullword"] as! Bool
                    if isfullword {
                        let index = playerinfo.firstIndex(where: { $0.rank == result!["rank"] as! Int })
                        playerinfo[index!].score = playerinfo[index!].score + (result!["wordcount"] as! Int)
                        refresh()
                    }
                    
                }else {
                    
                    let highscore = playerinfo.map { $0.score }.max()
                    var index = playerinfo.firstIndex(where: { $0.score == highscore })
                    
                    if( playerinfo[index!].score > 0 ){
                        let indexPath = IndexPath(row: index!, section: 0)
                        let cell = tableviewplayer.cellForRow(at: indexPath)
                        cell?.backgroundColor = .cyan
                        
                        inputstring.text = ""
                        alertmessage(msg: "No matching words and the winner is \n \(playerinfo[index!].name)")
                        resultstring.text = "Enter Your First Char Below"
                    }else{
                        inputstring.text = ""
                        alertmessage(msg: "No matching words and the winner is \n No One")
                        resultstring.text = "Enter Your First Char Below"
                    }
                    
                    
                    
                    index = playerinfo.firstIndex(where: { $0.rank == result!["rank"] as! Int })
                    playerinfo[index!].lifeline = playerinfo[index!].lifeline-1
                    refresh()
                    
                    
                    for i in 0..<playerinfo.count {
                        if(playerinfo[i].lifeline <= 0){
                            let indexPath = IndexPath(row: i, section: 0)
                            let cell = tableviewplayer.cellForRow(at: indexPath)
                            cell?.backgroundColor = .lightGray
                        }
                    }
                    
                    
                    
                    gameplay = GameLogic()
                }
                
            }
            else{
                alertmessage(msg: "No one has lifeline \n Game Over")
            }
            
            
        }
      //  activityIndicator.stopAnimating()
    }
    
    
    func refresh(){
        self.tableviewplayer.reloadData()
        //self.refresh().endRefreshing()
    }
    
    @IBAction func stopgame(stop : UIButton){
       
        alertmessage(msg: "The Winner is : ")
        
    }
    
    func alertmessage(msg : String) {
        let uialertcontroller = UIAlertController(title: "Hashedin", message: msg,preferredStyle: UIAlertController.Style.alert)
        uialertcontroller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil ))
        present(uialertcontroller,animated: true,completion: nil)
    }
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 1
    }
}



