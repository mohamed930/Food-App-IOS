//
//  Food.swift
//  FoodApp
//
//  Created by Mohamed Ali on 8/8/19.
//  Copyright © 2019 Mohamed Ali. All rights reserved.
//

import Foundation

class Food {
    private var Name:String?
    private var Details:String?
    private var Image:String?
    
    init(Name:String,Details:String,Image:String) {
        self.Name = Name
        self.Details = Details
        self.Image = Image
    }
    
    public func getName() ->String
    {
        return Name!
    }
    
    public func getDetails() ->String
    {
        return Details!
    }
    
    public func getImage() ->String
    {
        return Image!
    }
    
}
