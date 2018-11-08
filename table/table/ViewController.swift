//
//  ViewController.swift
//  table
//
//  Created by Denis Borodaenko on 24/10/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.


import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let animals: [String] = ["Dima","Nikita","Denis"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        
        // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "Segue" {
            if let indexPath = sender as? IndexPath {
                let destinationVC = segue.destination as! View0
                destinationVC.name = self.animals[indexPath.row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue" , sender: indexPath)
    }
}
