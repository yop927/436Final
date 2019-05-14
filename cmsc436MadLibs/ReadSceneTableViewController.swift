//
//  ReadSceneTableViewController.swift
//  cmsc436MadLibs
//
//  Created by Michael Taeyoung Kim on 4/25/19.
//  Copyright © 2019 Michael Taeyoung Kim. All rights reserved.
//

import UIKit
import Firebase

class ReadSceneTableViewController: UITableViewController {
    let root = Database.database().reference()
    
    var games : [CompletedGame] = [] //= [CompletedGame(title: "base", text: "don't fail", regVal: "VERB", resultString : "result")]
    override func viewDidLoad() {
        startObserving()
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func startObserving(){
        root.child("completedGames").observe(.value, with: {(snap) in
            var newGames = [CompletedGame]()
            for gameSnaps in snap.children {
                let game = CompletedGame(snapshot: gameSnaps as! DataSnapshot)
                newGames.append(game)
                self.games = newGames
                self.tableView.reloadData()
            }
        })
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return games.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row].title
        cell.detailTextLabel?.text = games[indexPath.row].text
        cell.backgroundColor = UIColor(red: 137/255, green: 162/255, blue: 162/255, alpha: 1)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ReadView") as? ReadSceneViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        var tempArray = [String]()
        var tempStringArr = [String]()
        
        tempArray = games[indexPath.row].regVal
        tempStringArr = games[indexPath.row].resultString
        vc?.storyContent = tempArray
        vc?.stringContent = tempStringArr
        vc?.storyTitle = games[indexPath.row].title
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct Story {
    var title : String
    var content : String
}
