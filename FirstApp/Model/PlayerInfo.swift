//
//  PlayerInfo.swift
//  FirstApp
//
//  Created by hasher on 08/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//
// created to maintain all players information using struct
import Foundation

struct PlayerInfo {
    var name : String
    var score : Int
    var lifeline : Int
    var status : String
    var rank : Int = 0
    init(name : String,lifeline : Int) {
        self.name = name
        self.lifeline = lifeline
        self.score = 0
        self.status = "qualified"
    }
    mutating func updatescore(score : Int) -> Bool{
        self.score = score
        return true
    }
    mutating func updatestatus(status : String) -> Bool{
        self.status = status
        return true
    }
    mutating func updatelifeline(lifeline : Int) -> Bool{
        self.lifeline = lifeline
        return true
    }
    mutating func updaterank(rank : Int) -> Bool{
        self.rank = rank
        return true
    }
    
    
    mutating func validatename() -> Bool {
        if self.name.count > 0{
            return true
        }
        return false
    }
    
}
