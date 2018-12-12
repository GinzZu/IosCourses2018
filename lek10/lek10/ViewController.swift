//
//  ViewController.swift
//  lek10
//
//  Created by Denis Borodaenko on 28/11/2018.
//  Copyright © 2018 Denis Borodaenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBAction func redSliderChanged(_ sender: Any) {
        
        self.mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255.0, green: CGFloat(greenSlider.value)/255.0, blue: CGFloat(blueSlider.value)/255.0, alpha: 1.0)
    }
    
    
    override func viewDidLoad() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        mainView.addGestureRecognizer(tap)
        
       
        mainView.layer.cornerRadius = mainView.bounds.size.width/2
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255.0, green: CGFloat(greenSlider.value)/255.0, blue: CGFloat(blueSlider.value)/255.0, alpha: 1.0)
    

        
        super.viewDidLoad()

    }

    @objc func doubleTapped() {
        
        if self.mainView.alpha == 1.0{
            self.mainView.alpha =  CGFloat(0.1)
        }else{
            self.mainView.alpha =  CGFloat(1.0)
        }
        
    }

}
