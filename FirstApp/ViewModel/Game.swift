//
//  Game.swift
//  FirstApp
//
//  Created by hasher on 08/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation

class Game{
    
    var word : String
    var resultstring : String = ""
    var arraywords : [String] = []
    //var scoretable = ResultBoard()
    
    init(word : String) {
        self.word = word
        //scoretable = ResultBoard()
    }
    var wordstring : String {
        get { return self.word }
        set { self.word = newValue }
    }
    
    var setresultstring : String {
        get { return self.resultstring }
        set { self.resultstring = newValue }
    }
    
    func checkmatches(player : PlayerInfo, char : Character) -> Bool {
        var currentstring = self.resultstring + String(char)
        
        
        //if self.resultstring.count == 0 {
        var cahrnth = Array(self.word)[self.resultstring.count]
        if char == cahrnth{
            //scoretable.increamentscore(player : player)
            return true
        }else{
            //scoretable.decreamentscore(player : player)
            return false
        }
        //}
        //return true
    }
    
    func parsedict(word : String) -> Bool {
         
         if let path = Bundle.main.path(forResource: "wordsdict", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                //let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data, options: [])
                guard let jsonArray = jsonResponse as? [String: Any] else {
                    return false
                }
                
                arraywords = filterContentForSearchText(searchText: "he",dictword:Array(jsonArray.keys))
                
                //let val1 = arraywords.elementsEqual("hel")
                
                print(arraywords)
                
                //let my_bool = arraywords.contains("help")
                //let indexof = arraywords.index(of: "help")
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        return true
    }
    func filterContentForSearchText(searchText: String,dictword:[String]) -> [String] {
        let filterdItemsArray = dictword.filter { item in
            
            return item.lowercased().starts(with: searchText.lowercased())
            
        }
        return filterdItemsArray
    }
}



