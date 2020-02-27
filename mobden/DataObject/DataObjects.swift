//
//  DataObjects.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct Word : Decodable, Identifiable{
    var id:Int
    var image:String
    var title:String
    var description:String
    
    
}




struct Article : Decodable, Identifiable{
    var id:Int
    var image:String
    var title:String
    var description:String
    var creationDate:String
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    
}

struct AboutSchool : Decodable, Identifiable{
    var id:Int
    var image:String
    var tile:String
    
    var creationDate:String
    var link:String
    
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
      
}




struct HonorBoard : Decodable ,Identifiable{
var id:Int
var studentFullName:String
var image:String

var creationDate:String
var description:String
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
}

