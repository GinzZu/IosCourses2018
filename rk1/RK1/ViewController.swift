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
    let title: String?
    let episodes: String?
    let episode_length: String?
    let description: String?
}

struct AnimeJson {
    var name: String?
    var title: String?
    var episodes: String?
    var episode_length: String?
    var description: String?
}


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var arrAnime = [AnimeJson]()
    
    var images = [UIImage]()
    
    let names = ["attack_on_titan","beck","clannad","code_geass","fma",
                 "gto","monster", "opm", "steinsgate","usagi"]
    
    fileprivate let session = URLSession(configuration: URLSessionConfiguration.default)

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        if !arrAnime.isEmpty && !images.isEmpty{
            cell.imageCell.image = images[indexPath.row]
            cell.nameLabelCell.text = arrAnime[indexPath.row].name ?? "None"
            cell.descLabelCell.text = arrAnime[indexPath.row].episodes ?? "None"
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
            
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "Segue" {
            if let indexPath = sender as? IndexPath {
                let destinationVC = segue.destination as! SecViewController
                destinationVC.image.image = self.images[indexPath.row]
                destinationVC.name.text = self.arrAnime[indexPath.row].name!
                destinationVC.episods.text = self.arrAnime[indexPath.row].episodes!
                destinationVC.ep_length.text  = self.arrAnime[indexPath.row].episode_length!
                destinationVC.desc.text = self.arrAnime[indexPath.row].description!
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue" , sender: indexPath)
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
                
                self!.images.append(image)
            }
            
            let JsonURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/" + el + ".json"
            
            let gitUrl = URL(string: JsonURL)!
            
            URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(Anime.self, from: data)
            
//                        self.newAnime.name = gitData.name!
//                        self.newAnime.title = gitData.title!
//                        self.newAnime.episodes = "Episodes: " + gitData.episodes!
//                        self.newAnime.episode_length = gitData.episode_length!
//                        self.newAnime.description = gitData.description!
                    
                        self.arrAnime.append(AnimeJson(name: gitData.name,
                                                       title: gitData.title,
                                                       episodes: gitData.episodes,
                                                       episode_length: gitData.episode_length,
                                                       description: gitData.description))
                } catch let err {
                    print("Err", err)
                }
                }.resume()
            
        }
        
        
    }
    
}

