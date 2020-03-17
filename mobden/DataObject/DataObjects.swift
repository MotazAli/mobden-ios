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
    registrationView = 5 , publicRelationView = 6 ,supervisionView = 7 , supervisionListView = 8 ,
    supervisionInfoView = 9 , supervisionTeamView = 10 , comprehensiveView = 11 , transferView = 12,
    newsView = 13 , leadership = 14 ,planWork = 15 ,studentSupervisionView = 16 ,
    studentActivityView = 17 , resourcesLaboratory = 18 , homework = 19 ,honorBoard = 20
    
    
}


struct Word : Decodable, Identifiable{
    var id:Int
    var image:String
    var title:String
    var description:String
    
    
}




struct Article : Codable, Identifiable{
    var id:Int = 0
    var image:String = ""
    var title:String = ""
    var stage:Int = 0
    var description:String = ""
    var creationDate:String = ""
    var lastModifiedDate:String = ""
    var creationUserId : Int = 0
    var modifiedUserId : Int = 0
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.lastModifiedDate = try container.decodeIfPresent(String.self, forKey: .lastModifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0
        
    }
    
    
    
    enum CodingKeys : String ,CodingKey{

        case id = "id"
        case image = "image"
        case title = "title"
        case stage = "stage"
        case description = "description"
        case creationDate = "creationDate"
        case lastModifiedDate = "lastModifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
    }
    
    
    
}


struct News : Codable, Identifiable{
    var id:Int = 0
    var image:String = ""
    var title:String = ""
    var stage:Int = 0
    var description:String = ""
    var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId : Int = 0
    var modifiedUserId : Int = 0
    var facebookUrl :String = ""
    var newsImages = [NewsImage]()
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0
        self.facebookUrl = try container.decodeIfPresent(String.self, forKey: .facebookUrl) ?? ""
        self.newsImages = try container.decodeIfPresent([NewsImage].self, forKey: .newsImages) ?? [NewsImage]()

    }
    
    
    
    enum CodingKeys : String ,CodingKey{

        case id = "id"
        case image = "image"
        case title = "title"
        case stage = "stage"
        case description = "description"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
        case facebookUrl = "facebookUrl"
        case newsImages = "newsImages"
    }
    
    
    
}



struct NewsImage : Codable, Identifiable{
    var id:Int = 0
    var image:String = ""
    var stage:Int =  0
    var newsId:Int = 0
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.newsId = try container.decodeIfPresent(Int.self, forKey: .newsId) ?? 0
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        

    }
    
    
    enum CodingKeys : String , CodingKey{
       case id = "id"
        case image = "image"
        case newsId = "newsId"
        case stage = "stage"
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




struct HonorBoard : Codable ,Identifiable{
var id:Int = 0
var studentFullName:String = ""
var image:String = ""
    var studentID:Int = 0
    var studentStage:Int = 0
    var studentClass:Int = 0
var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId:Int = 0
    var modifiedUserId:Int = 0
var description:String = ""
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    
    
    
    
    init() {}
     
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
         self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.studentID = try container.decodeIfPresent(Int.self, forKey: .studentID) ?? 0
        self.studentStage = try container.decodeIfPresent(Int.self, forKey: .studentStage) ?? 0
        self.studentClass = try container.decodeIfPresent(Int.self, forKey: .studentClass) ?? 0
         self.studentFullName = try container.decodeIfPresent(String.self, forKey: .studentFullName) ?? ""
         self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
         self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
         self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
         self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
         self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0

     }
     
     
     enum CodingKeys : String , CodingKey{
        case id = "id"
         case image = "image"
         case studentFullName = "studentFullName"
         case studentID = "studentID"
        case studentStage = "studentStage"
        case studentClass = "studentClass"
         case description = "description"
         case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
        
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



//struct DepartmentLeader : Decodable ,Identifiable{
//var id:Int
//var name:String
//var image:String
//var phone:String
//    
//    
//}



struct TransferDescription : Decodable ,Identifiable{
var id:Int
var title:String
var description:String
    
    
}




struct Team : Decodable ,Identifiable{
var id:Int
var name:String
var image:String
var status:String
var roleDescription:String

}


struct Leadership : Codable , Identifiable{
    var id:Int = 0
    var name:String = ""
    var image:String = ""
    var job:String = ""
    var councilStatus:Int = 0
    var stage:Int = 0
    var councilStatusName : String {
        
        if councilStatus == 1 {return "قائد المدرسة"}
        else if councilStatus == 2 {return "نائب الرئيس"}
        else if councilStatus == 3 {return "عضو"}
        else {return ""}
        
    }
    
    init() {}
    
   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.job = try container.decodeIfPresent(String.self, forKey: .job) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.councilStatus = try container.decodeIfPresent(Int.self, forKey: .councilStatus) ?? 0
        

    }
    
    
    enum CodingKeys : String , CodingKey{
       case id = "id"
        case image = "image"
        case name = "name"
        case job = "job"
        case councilStatus = "councilStatus"
        case stage = "stage"
    }
    
}



struct DepartmentLeader : Codable , Identifiable{
    var id:Int = 0
    var name:String = ""
    var image:String = ""
    var departmentID:Int = 0
    var phone:String = ""
    var deleted:Bool = false
    var stage:Int = 0
    var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId:Int = 0
    var modifiedUserId:Int = 0
    
    init() {}
    
   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.departmentID = try container.decodeIfPresent(Int.self, forKey: .departmentID) ?? 0
        self.deleted = try container.decodeIfPresent(Bool.self, forKey: .deleted) ?? false
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0

    }
    
    
    enum CodingKeys : String , CodingKey{
       case id = "id"
        case image = "image"
        case name = "name"
        case departmentID = "departmentID"
        case phone = "phone"
        case deleted = "deleted"
        case stage = "stage"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
    }
    
}




struct Fees : Decodable, Identifiable{
    var id:Int
    var name:String
    var fees:Int

    var creationDate:String
    var notes:String
        var arabicDate:String{
            get{
                
                return SystemDates.getArabicDate(date:self.creationDate)
                    
            }
        }
   
    var feesString :String { return String(self.fees)}
    
        
}






struct StudentSupervision : Codable , Identifiable{
    var id:Int = 0
    var title:String = ""
    var description:String = ""
    var stage:Int = 0
    var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId:Int = 0
    var modifiedUserId:Int = 0
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    init() {}
    
   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0

    }
    
    
    enum CodingKeys : String , CodingKey{
       case id = "id"
        case title = "title"
        case description = "description"
        
        case stage = "stage"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
    }
    
}





struct StudentActivity : Codable, Identifiable{
    var id:Int = 0
    var image:String = ""
    var title:String = ""
    var stage:Int = 0
    var description:String = ""
    var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId : Int = 0
    var modifiedUserId : Int = 0
    
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0
        

    }
    
    
    
    enum CodingKeys : String ,CodingKey{

        case id = "id"
        case image = "image"
        case title = "title"
        case stage = "stage"
        case description = "description"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
        
    }
    
    
    
}


struct ResourcesLaboratory : Codable, Identifiable{
    var id:Int = 0
    var title:String = ""
    var stage:Int = 0
    var description:String = ""
    var creationDate:String = ""
    var modifiedDate:String = ""
    var creationUserId : Int = 0
    var modifiedUserId : Int = 0
    
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0
        

    }
    
    
    
    enum CodingKeys : String ,CodingKey{

        case id = "id"
        case title = "title"
        case stage = "stage"
        case description = "description"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
        
    }
    
    
    
}



struct Homework : Codable, Identifiable{
    var id:Int = 0
    var title:String = ""
    var stage:Int = 0
    var classId:Int = 0
    var week:Int = 0
    var file:String = ""
    var description:String = ""
    var creationDate:String = ""
    var modifiedDate:String = ""
    var startDate:String = ""
    var endDate:String = ""
    var creationUserId : Int = 0
    var modifiedUserId : Int = 0
    
    var arabicDate:String{
        get{
            
            return SystemDates.getArabicDate(date:self.creationDate)
                
        }
    }
    
    
    var className : String {
        if classId == 1 {return "الصف الاول"}
        else if classId == 2 {return "الصف الثانى"}
        else if classId == 3 {return "الصف الثالث"}
        else if classId == 4 {return "الصف الرابع"}
        else if classId == 5 {return "الصف الخامس"}
        else if classId == 6 {return "الصف السادس"}
        
        else { return "لا يوجد"}
    }
    
    var weekName : String {
        if week == 1 {return "الاسبوع الاول"}
        else if week == 2 {return "الاسبوع الثانى"}
        else if week == 3 {return "الاسبوع الثالث"}
        else if week == 4 {return "الاسبوع الرابع"}
        else if week == 5 {return "الاسبوع الخامس"}
        else if week == 6 {return "الاسبوع السادس"}
        else if week == 7 {return "الاسبوع السابع"}
        else if week == 8 {return "الاسبوع الثامن"}
        else if week == 9 {return "الاسبوع التاسع"}
        else if week == 10 {return "الاسبوع العاشر"}
        else if week == 11 {return "الاسبوع الحادى عشر"}
        else if week == 12 {return "الاسبوع الثانى عشر"}
        else if week == 13 {return "الاسبوع الثالث عشر"}
        else if week == 14 {return "الاسبوع الرابع عشر"}
        else if week == 15 {return "الاسبوع الخامس عشر"}
        else if week == 16 {return "الاسبوع السادس عشر"}
        else if week == 17 {return "الاسبوع السابع عشر"}
        else if week == 18 {return "الاسبوع الثامن عشر"}
        else if week == 19 {return "الاسبوع التاسع عشر"}
        else if week == 20 {return "الاسبوع العشرون"}
        else { return "لا يوجد"}
    }
    
    
    
    init(){  }
    
     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.stage = try container.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        self.classId = try container.decodeIfPresent(Int.self, forKey: .classId) ?? 0
        self.week = try container.decodeIfPresent(Int.self, forKey: .week) ?? 0
        self.file = try container.decodeIfPresent(String.self, forKey: .file) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate) ?? ""
        self.modifiedDate = try container.decodeIfPresent(String.self, forKey: .modifiedDate) ?? ""
        self.startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        self.endDate = try container.decodeIfPresent(String.self, forKey: .endDate) ?? ""
        self.creationUserId = try container.decodeIfPresent(Int.self, forKey: .creationUserId) ?? 0
        self.modifiedUserId = try container.decodeIfPresent(Int.self, forKey: .modifiedUserId) ?? 0
        

    }
    
    static func getClassName(classId:Int) -> String {
        if classId == 1 {return "الصف الاول"}
        else if classId == 2 {return "الصف الثانى"}
        else if classId == 3 {return "الصف الثالث"}
        else if classId == 4 {return "الصف الرابع"}
        else if classId == 5 {return "الصف الخامس"}
        else if classId == 6 {return "الصف السادس"}
        
        else { return "لا يوجد"}
    }
    
    enum CodingKeys : String ,CodingKey{

        case id = "id"
        case title = "title"
        case stage = "stage"
        case classId = "class"
        case week = "weak"
        case file = "file"
        case description = "description"
        case creationDate = "creationDate"
        case modifiedDate = "modifiedDate"
        case startDate = "startDate"
        case endDate = "endDAte"
        case creationUserId = "creationUserId"
        case modifiedUserId = "modifiedUserId"
        
    }
    
    
    
}






