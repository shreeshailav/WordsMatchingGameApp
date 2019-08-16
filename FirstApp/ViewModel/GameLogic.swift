//
//  GameLogic.swift
//  FirstApp
//
//  Created by hasher on 12/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation

class GameLogic{
    var resultstring : String
    var arraywords : [String] = []
    
    var jsonObject: [String: Any] = [
        "rank": 0,
        "fullword": false,
        "wordcount": 0,
        "found" : false,
        "error" : "error"
    ]
    
    init() {
        resultstring = ""
    }
    
    func checkmatches(player : PlayerInfo, char : Character) -> [String : Any] {
        let currentstring = self.resultstring + String(char)
        
        let result = parsedict(word: currentstring)
        let found = result["found"] as! Bool
        
        if found{
            resultstring = currentstring
        }
        jsonObject.updateValue(player.rank, forKey: "rank")
        return jsonObject
       
    }
    
    func parsedict(word : String) -> [String : Any] {
        
        if let path = Bundle.main.path(forResource: "wordsdict", ofType: "json") {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                //let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data, options: [])
                guard let jsonArray = jsonResponse as? [String: Any] else {
                    return jsonObject
                }
                arraywords = filterContentForSearchText(searchText: word,dictword:Array(jsonArray.keys))
                
                print(arraywords)
                
                
                
                if arraywords.count > 0 {
                    jsonObject.updateValue(false, forKey: "fullword")
                    jsonObject.updateValue(0, forKey: "wordcount")
                    if word.count>1{
                        for i in arraywords {
                            if i == word.lowercased() {
                                jsonObject.updateValue(true, forKey: "fullword")
                                jsonObject.updateValue(word.count, forKey: "wordcount")
                                break
                            }
                        }
                    } 
                    
                    jsonObject.updateValue(true, forKey: "found")
                    jsonObject.updateValue("noerror", forKey: "error")
                    return jsonObject
                }
                
            } catch let parsingError {
                print("Error", parsingError)
                jsonObject.updateValue(false, forKey: "fullword")
                jsonObject.updateValue(0, forKey: "wordcount")
                jsonObject.updateValue(false, forKey: "found")
                jsonObject.updateValue("error", forKey: "error")
                return jsonObject
            }
        }
        jsonObject.updateValue(false, forKey: "fullword")
        jsonObject.updateValue(0, forKey: "wordcount")
        jsonObject.updateValue(false, forKey: "found")
        jsonObject.updateValue("noerror", forKey: "error")
        

        return jsonObject
    }
    func filterContentForSearchText(searchText: String,dictword:[String]) -> [String] {
        let filterdItemsArray = dictword.filter { item in
            return item.lowercased().starts(with: searchText.lowercased())
        }
        return filterdItemsArray
    }
    
    
    
    
    
}
