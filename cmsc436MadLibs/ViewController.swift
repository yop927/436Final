//
//  ViewController.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 4/24/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import UIKit
import Firebase
extension String {
    func split(usingRegex pattern: String) -> [String] {
        //### Crashes when you pass invalid `pattern`
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(0..<utf16.count))
        let ranges = [startIndex..<startIndex] + matches.map{Range($0.range, in: self)!} + [endIndex..<endIndex]
        return (0...matches.count).map {String(self[ranges[$0].upperBound..<ranges[$0+1].lowerBound])}
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titleText: UILabel!
    var root = Database.database().reference()
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        // Do any additional setup after loading the view.
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        let myColor : UIColor = UIColor( red: 100/255, green: 130/255, blue:128/255, alpha: 1.0 )
        textField.layer.borderColor = myColor.cgColor

        textField.layer.backgroundColor = myColor.cgColor
        //let root = Database.database().reference()
        
        if Auth.auth().currentUser == nil {
            let alert = UIAlertController(title: "Sign In", message: "You must be signed in to save", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert,animated: true)
        }

    }
  
    @IBAction func adjectiveButton(_ sender: Any) {
        if let text = textField.text {
           var textString = text + " {adjective} "
           textField.text = textString
        }
        
    }
    
    @IBAction func adverbButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {adverb} "
             textField.text = textString
        }
    }
    
    @IBAction func nounButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {noun} "
             textField.text = textString
        }
    }
    
    @IBAction func pluralNounButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {plural noun} "
             textField.text = textString
        }
    }
    
    @IBAction func verbButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {verb} "
             textField.text = textString
        }
    }
    
    @IBAction func numberButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {number} "
             textField.text = textString
        }
    }
    
    @IBAction func colorButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {color} "
             textField.text = textString
        }
    }
    
    @IBAction func nameButton(_ sender: Any) {
        if let text = textField.text {
            var textString = text + " {name}"
             textField.text = textString
        }
    }
    
    @IBAction func DoneButton(_ sender: Any) {
        let text = textField.text
        
        //separateWords(text: text)
        let regex = "\\{(.*?)\\}"
        let separator = "\\{(.*?)\\}"
        var regResult = matchesForRegexInText(regex: regex, text: text)
        let result = text?.split(usingRegex: separator)
        let alert = UIAlertController(title: "Save", message: "Save game and exit?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default, handler: {(action) in
            var title = ""
            if alert.textFields?[0].text == "" {
                title = "No Name"
            } else {
                title = alert.textFields?[0].text ?? ""
            }
            
            let ref = self.root.child("games").childByAutoId()
            ref.child("title").setValue(title)
            ref.child("text").setValue(text)
            ref.child("regex").setValue(regResult)
            ref.child("resultString").setValue(result)
            self.textField.text = ""
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addTextField(configurationHandler: nil)
        present(alert,animated: true)
    }
 /*
    func separateWords(text: String) {
        var stringContainer = [Character]()
        var mode = 0
        
    }
 */
    
    
    func matchesForRegexInText(regex: String!, text: String!) -> [String] {
        
        do {
            
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            
            let results = regex.matches(in: text,
                                        options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
            
        } catch let error as NSError {
            
            print("invalid regex: \(error.localizedDescription)")
            
            return []
        }}
    
}

