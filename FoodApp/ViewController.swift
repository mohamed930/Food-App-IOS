//
//  ViewController.swift
//  FoodApp
//
//  Created by Mohamed Ali on 8/8/19.
//  Copyright © 2019 Mohamed Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var Collection: UICollectionView!
    public var foods = Array<Food>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in ReadFromPList(Name: "FoodData", dataType: "plist")
        {
            foods.append(Food(Name: i["Name"]!, Details: i["Des"]!, Image: i["Image"]!))
        }
        print("Readed Successfullty you can see details")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // these function for collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.FoodName.text = foods[indexPath.row].getName()
        cell.FoodImage.image = UIImage(named: foods[indexPath.row].getImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Next", sender: foods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
            if segue.identifier == "Next"
            {
                if let f1 = sender as? Food {
                    let vc = segue.destination as! ViewController2
                    vc.singelItem = f1
                }
            }
        }
    
    // this function for read from file
    func ReadFromPList (Name:String,dataType:String) -> [[String:String]]
    {
        let path = Bundle.main.path(forResource:Name,ofType:dataType)!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dicArray = plist as! [[String:String]]
        return dicArray
    }
}

