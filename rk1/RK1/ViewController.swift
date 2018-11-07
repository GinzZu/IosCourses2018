//
//  ViewController.swift
//  RK1
//
//  Created by Denis Borodaenko on 31/10/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit
import SDWebImage

enum Method {
    case dumb
    case fixedDumb
    case session
    case lib
}
//import Gloss
//
//struct SimpleModel: Gloss.Decodable {
//    let name: String
//    let type: String
//    let episodes: String
//    let episode_length: String
//    let description: String
//
//    init(name: String?) {
//        self.name = name ?? "no name"
//        self.type = type ?? "no type"
//        self.episodes = episodes ?? "no episodes"
//        self.episode_length = episode_length ?? "no episode_length"
//        self.description = description ?? "no description"
//    }
//
//    init?(json: JSON) {
//        guard let name: String = "name" <~~ json else {
//            return nil
//        }
//
//        self.name = name
//    }
//}

//fileprivate struct Cells {
//    static let plain = "TableCell.plain"
//}


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    var names = ["attack_on_titan","beck","clannad","code_geass","fma",
                 "gits","gto","monster", "opm", "staingate","usagi"]
    
    fileprivate let session = URLSession(configuration: URLSessionConfiguration.default)
//    fileprivate var data: [SimpleModel] = []
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        let imageURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/" + self.names[indexPath.row] + ".jpg"
        
        let sourceURLJson = "https://github.com/techparkios/ios-lectures-fall-2018/blob/master/06/" + self.names[indexPath.row] + ".json"
        
        let url = URL(string: imageURL)!

        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            guard let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                cell.imageCell.image = image
            }
        }
        
        cell.nameLabelCell.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
            
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "Segue" {
            if let indexPath = sender as? IndexPath {
                let destinationVC = segue.destination as! SecViewController
//                destinationVC.name = self.animals[indexPath.row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue" , sender: indexPath)
    }
    

}

