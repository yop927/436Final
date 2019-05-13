//
//  MadlibGame.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 5/7/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import Foundation
import Firebase

class CompletedGame {
    var title: String?
    var text: String?
    var regVal = [String]()
    var resultString = [String]()
    var ref: DatabaseReference?
    
    init(snapshot: DataSnapshot){
        let data = snapshot.value as! NSDictionary
        //text = data["text"] as! String
        title = data["title"] as! String
        if data["regex"] != nil {
            regVal = data["regex"] as! [String]
        } else {
            print("it doesnt contain value")
        }
        
        if data["resultString"] != nil {
            resultString = data["resultString"] as! [String]
        } else {
            print("it doesnt contain value")
        }
        ref = snapshot.ref
    }
    
    init(title: String, text: String, regVal: String, resultString: String){
        self.title = title
        self.text = text
        self.regVal = [regVal]
        self.resultString = [resultString]
    }
}

