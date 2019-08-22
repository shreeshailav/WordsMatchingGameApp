//
//  File.swift
//  FirstApp
//
//  Created by hasher on 08/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation

class PlayerMove {
    
    
    var players : [PlayerInfo] = []
    var currentplayer : PlayerInfo
    init(player : [PlayerInfo]) {
        self.players = player
        self.currentplayer = player[0]
        //print(self.players.count)
    }
    deinit { print("\(self.currentplayer.name) is being deinitialized") }

    func nextmove(rank : Int , players : [PlayerInfo]) -> PlayerInfo {
        self.players = players
        var rk = rank
        let numberofplayer = players.count
        if rk == 1 {
            rk = numberofplayer
            var player = players.filter{$0.rank == (rk)}
            while player[0].lifeline == 0 {
                rk = rk - 1
                if rk <= 0 {
                    rk = numberofplayer
                }
                player = players.filter{$0.rank == (rk)}
            }
            return player[0]
        }else{
            rk = rk - 1
            var player = players.filter{$0.rank == (rk)}
            
            while player[0].lifeline == 0 {
                rk = rk - 1
                if rk <= 0 {
                    rk = numberofplayer
                }
                player = players.filter{$0.rank == (rk)}
            }
            
            return player[0] //players[pos]
        }
    }
    
    func getplayesinfo() -> [PlayerInfo] {
        return self.players
    }
    
    /*func nextmove(player : PlayerInfo ) -> PlayerInfo {
     switch player.name {
     case players[0].name : return players[1]
     case players[1].name : return players[2]
     case players[2].name : return players[3]
     case players[3].name : return players[0]
     default:
     return players[0]
     }
     } */
}
