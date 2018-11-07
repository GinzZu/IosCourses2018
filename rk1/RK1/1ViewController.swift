//
//  1ViewController.swift
//  RK1
//
//  Created by Denis Borodaenko on 07/11/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    

    @IBOutlet weak var episods: UILabel!
    
    @IBOutlet weak var ep_length: UILabel!
    @IBOutlet weak var desc: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
