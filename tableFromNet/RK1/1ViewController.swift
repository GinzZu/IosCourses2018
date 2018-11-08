//
//  1ViewController.swift
//  RK1
//
//  Created by Denis Borodaenko on 07/11/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit
//import SDWebImage




class SecViewController: UIViewController {
    
    var a : AnimeJson?
    var im : UIImage?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var episods: UILabel!
    @IBOutlet weak var ep_length: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image.image = im
        self.name.text = a?.name!
        self.episods.text = a?.episodes!
        self.ep_length.text = a?.episode_length!
        self.desc.text = a?.description!
    }
}
