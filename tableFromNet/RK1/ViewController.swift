//
//  ViewController.swift
//  RK1
//
//  Created by Denis Borodaenko on 31/10/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit
import SDWebImage


struct Anime: Codable {
    let name: String?
    let type: String?
    let episodes: String?
    let episode_length: String?
    let description: String?
}

struct AnimeJson {
    var name: String?
    var type: String?
    var episodes: String?
    var episode_length: String?
    var description: String?
}


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var arrAnime = [String : AnimeJson]()
    var images = [String : UIImage]()
    
    let names = ["attack_on_titan","beck","clannad","code_geass",
                 "gto","monster","usagi","fma"]
    
    fileprivate let session = URLSession(configuration: URLSessionConfiguration.default)

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        if (arrAnime[names[indexPath.row]] != nil){
            cell.nameLabelCell.text = arrAnime[names[indexPath.row]]!.name ?? "None"
            cell.descLabelCell.text = arrAnime[names[indexPath.row]]!.episodes ?? "None"
        }
        
        if (images[names[indexPath.row]] != nil){
            cell.imageCell.image = images[names[indexPath.row]]
        }
        
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
        createArray()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func createArray(){
        
        for el in self.names {
            
            let imageURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/" + el + ".jpg"
            
            let url = URL(string: imageURL)!
            
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let data = try? Data(contentsOf: url) else {
                    return
                }
                guard let image = UIImage(data: data) else {
                    return
                }
                self?.images[el] = image
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            }

            let jsonURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/" + el + ".json"
            
            let gitUrl = URL(string: jsonURL)!
            
            URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(Anime.self, from: data)
                    
                    self.arrAnime[el] = AnimeJson(name: gitData.name,
                                                   type: gitData.type,
                                                   episodes: gitData.episodes,
                                                   episode_length: gitData.episode_length,
                                                   description: gitData.description)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let err {
                    print("Err", err)
                }
                }.resume()
            
        }

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "Segue" {
            if let indexPath = sender as? IndexPath {
                for el in arrAnime{
                    print(el)
                }
                let destinationVC = segue.destination as! SecViewController
                destinationVC.a = arrAnime[names[indexPath.row]]
                destinationVC.im = images[names[indexPath.row]]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue" , sender: indexPath)
    }
    
    
}


