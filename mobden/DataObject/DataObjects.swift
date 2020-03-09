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





enum ViewScreen: Int {
    case noView = 0 ,wordView = 1, articlesView = 2 , articaleView = 3 , prizesView = 4,
    registrationView = 5 , publicRelation = 6 ,supervisionView = 7 , supervisionListView = 8 ,
    supervisionInfoView = 9 , supervisionTeamView = 10 , comprehensiveView = 11
    
    
}


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



struct RegisterFinance : Decodable, Identifiable{
    var id:Int
    var stage:Int
    var fees:Int

    var creationDate:String
    var notes:String
        var arabicDate:String{
            get{
                
                return SystemDates.getArabicDate(date:self.creationDate)
                    
            }
        }
    var stageName : String {
        switch self.stage {
            case (1):
                return "المرحله الابتدائيه"
            case (2):
                return "المرحله المتوسطه"
            case (3):
                return "المرحله الثانويه"
            case (4):
                return "رسوم النقل للأحياء الداخلية"
            case (5):
                return "رسوم النقل للأحياء الخارجية"
        default:
            return "لا يوجد"
        }
    }
    var feesString :String { return String(self.fees)}
    
        
}


struct RegistrationsRequired : Decodable, Identifiable{
    var id:Int
    var title:String
    var description:String
    var creationDate:String
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    
}


struct Prize : Decodable ,Identifiable{
var id:Int
var image:String

var creationDate:String
var description:String
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
}



struct PublicRelation : Decodable ,Identifiable{
var id:Int
var title:String
var description:String
    
    
}





struct SupervisionAndDevelopment : Decodable ,Identifiable{
var id:Int
var title:String
var description:String
    
    
}

struct SupervisionTeam : Decodable ,Identifiable{
var id:Int
var name:String
var image:String
var status:String
    
    
}


struct SupervisionPlan : Decodable ,Identifiable{
var id:Int
var linkTitle:String
var departmentID:Int
var planFile:String


}


struct ManagmentDepartmentPlan :Codable , Identifiable {
    var id:Int?
    var linkTitle:String?
    var planFile :String?
    var departmentID :Int?
    var creationDate:String?
    var modifiedDate :String?
    var creationUserId :Int?
    var modifiedUserId :Int?



    
    enum CodingKeys : String ,CodingKey{

        case id = "ID"
        case linkTitle = "LinkTitle"
        case planFile = "PlanFile"
        case departmentID = "DepartmentID"
        case creationDate = "CreationDate"
        case modifiedDate = "ModifiedDate"
        case creationUserId = "CreationUserId"
        case modifiedUserId = "ModifiedUserId"
    }
}






struct Comprehensive : Decodable ,Identifiable{
var id:Int
var title:String
var description:String
    
    
}



struct DepartmentLeader : Decodable ,Identifiable{
var id:Int
var name:String
var image:String
var phone:String
    
    
}
