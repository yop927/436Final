//
//  PlaySceneViewController.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 5/7/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import UIKit
import Firebase

class PlaySceneViewController: UIViewController {
    var root = Database.database().reference()
    var storyTitle : String!
    var storyContent = [String]()
    var stringContent = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        TitleOutlet.text = storyTitle

        //ContentOutlet.text = storyContent
        // Do any additional setup after loading the view.
        var yValue = 220.0
        var index = 1
        //CGRect(
        for i in storyContent {
            let txtField = UITextField(frame: CGRect(x:10.0, y: yValue, width: Double(UIScreen.main.bounds.size.width-20.0), height: 40.0))
            let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
            txtField.placeholder = i
            txtField.layer.cornerRadius = 10.0
            txtField.layer.borderColor = myColor.cgColor
            txtField.layer.borderWidth = 2.0
            txtField.backgroundColor = UIColor.brown
            txtField.tag = index
            index = index + 1
            txtField.tintColor = UIColor.gray
            yValue = yValue + 50
            self.view.addSubview(txtField)
        }
 
    }


    @IBOutlet weak var TitleOutlet: UILabel!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func DoneButton(_ sender: Any) {
        var wordsArray: [String] = []
        var count = 0
        for i in storyContent
        {
            count = count + 1
        }
        for i in 1...count {
            let textField: UITextField = view.viewWithTag(i) as! UITextField
            let textInput = textField.text
            //CREATE AN ALERT WHERE IF ANYTHING IS LEFT BLANK
            if textInput != nil {
                wordsArray.append(textInput!)
            } else {
                print("it is left blank")
            }
        }

        //let title = TitleOutlet.text
        var tempStringArr: [String] = []
        var count2 = 0
        for i in stringContent {
            tempStringArr.append(i)
        }
        print(tempStringArr)
        let alert = UIAlertController(title: "Done? Give it a New Name", message: "Finish the game?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Yes", style: .default, handler: {(action) in
            var title = ""
            if alert.textFields?[0].text == "" {
                title = "No Name"
            } else {
                title = alert.textFields?[0].text ?? ""
            }
            let ref = self.root.child("completedGames").childByAutoId()
            ref.child("title").setValue(title)
            ref.child("regex").setValue(wordsArray)
            ref.child("resultString").setValue(tempStringArr)
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addTextField(configurationHandler: nil)
        present(alert,animated: true)
    }
}
