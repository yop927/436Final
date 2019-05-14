//
//  ReadSceneViewController.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 4/25/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import UIKit
import Firebase


class ReadSceneViewController: UIViewController {
    
    var storyTitle : String!
    var storyContent = [String]()
    var stringContent = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        TitleOutlet.text = storyTitle
        let myColor : UIColor = UIColor( red: 100/255, green: 130/255, blue:128/255, alpha: 1.0 )
        ContentOutlet.layer.borderColor = myColor.cgColor
        ContentOutlet.layer.backgroundColor = myColor.cgColor
        var finalString = ""
        var count = 0
        var countTil = 0
        if storyContent.count > stringContent.count {
            for i in 1...stringContent.count {
                finalString.append(stringContent[count])
                finalString.append(storyContent[count])
                count = count + 1
            }
            finalString.append(storyContent[count])
        } else if storyContent.count < stringContent.count {
            for i in 1...storyContent.count {
                finalString.append(stringContent[count])
                finalString.append(storyContent[count])
                count = count + 1
            }
            finalString.append(stringContent[count])
        } else {
            for i in 1...storyContent.count {
                finalString.append(stringContent[count])
                finalString.append(storyContent[count])
                count = count + 1
            }
        }
    
        // Do any additional setup after loading the view.
        ContentOutlet.text = finalString
 
    }
    
    @IBOutlet weak var TitleOutlet: UILabel!
    
    @IBOutlet weak var ContentOutlet: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
