//
//  MainSceneViewController.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 4/24/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import UIKit

class MainSceneViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateButton(_ sender: Any) {
        
    }
    
    @IBAction func TemplateButton(_ sender: Any) {
    }
    
    @IBAction func ReadButton(_ sender: Any) {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
