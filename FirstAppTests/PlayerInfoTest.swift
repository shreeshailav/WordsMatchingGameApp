//
//  PlayerInfoTest.swift
//  FirstAppTests
//
//  Created by hasher on 19/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation
import XCTest

@testable import FirstApp

class PlayerInfoTest: XCTestCase {
    
    
    func testvalidateValue() {
        var playerinfo = PlayerInfo(name : "shree" , lifeline : 2)
        XCTAssertTrue(playerinfo.validatename())
    }
    
    func testvalidateplayerinfo() {
        
    }
    func testvalidate()  {
        //
    }
}

