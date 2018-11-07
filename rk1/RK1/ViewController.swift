//
//  ViewController.swift
//  RK1
//
//  Created by Denis Borodaenko on 31/10/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var posts = ["Monster"]
    
    let a = UIImage()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
//        cell.nameLabelCell.text = posts[indexPath.row]
//        let c = UIImage(named: "beck-1")
//        cell.imageCell.image = c
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    

}

