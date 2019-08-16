//
//  CustomTableViewCell.swift
//  FirstApp
//
//  Created by hasher on 10/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var playername: UILabel!
    
    @IBOutlet weak var playerscore: UILabel!
    
    @IBOutlet weak var playerlifeline: UILabel!
    
    @IBOutlet weak var playerstatus: UILabel!
    
    func setname(name : String) {
        self.playername.text = name
    }
    
}
