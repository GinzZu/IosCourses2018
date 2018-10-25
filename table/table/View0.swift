//
//  View0.swift
//  table
//
//  Created by Denis Borodaenko on 24/10/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit

class View0: UIViewController {
    
    var name:String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
        // Do any additional setup after loading the view.
    }

}
