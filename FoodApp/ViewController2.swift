//
//  ViewController2.swift
//  FoodApp
//
//  Created by Mohamed Ali on 8/8/19.
//  Copyright © 2019 Mohamed Ali. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var FoodImage: UIImageView!
    @IBOutlet weak var FoodName: UILabel!
    @IBOutlet weak var FoodDestails: UITextView!
    
    var singelItem:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FoodName.text = singelItem?.getName()
        FoodDestails.text = singelItem?.getDetails()
        FoodImage.image = UIImage(named: (singelItem?.getImage())!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
