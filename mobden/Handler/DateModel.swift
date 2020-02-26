//
//  DateModel.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



struct SystemDates{
    
    static func getArabicDate(date : String) -> String {
       var Msg_Date_ = date
          
              let dateFormatterGet = DateFormatter()
              dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
              let dateFormatterPrint = DateFormatter()
              //dateFormatterPrint.dateFormat = "MMM dd yyyy h:mm a"  //"MMM d, h:mm a" for  Sep 12, 2:11 PM
       dateFormatterPrint.locale = NSLocale(localeIdentifier: "ar_SA") as Locale

       dateFormatterPrint.dateFormat = "EEEE, d, MMMM, yyyy HH:mm a"
              let datee = dateFormatterGet.date(from: Msg_Date_)
              Msg_Date_ =  dateFormatterPrint.string(from: datee ?? Date())
        
        return Msg_Date_
    }
    
    
    static func getEnglishDate(date : String) -> String {
       var Msg_Date_ = date
          
              let dateFormatterGet = DateFormatter()
              dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
              let dateFormatterPrint = DateFormatter()
              dateFormatterPrint.dateFormat = "MMM dd yyyy h:mm a"  //"MMM d, h:mm a" for  Sep 12, 2:11 PM
       //dateFormatterPrint.locale = NSLocale(localeIdentifier: "ar_SA") as Locale

       //dateFormatterPrint.dateFormat = "EEEE, d, MMMM, yyyy HH:mm a"
              let datee = dateFormatterGet.date(from: Msg_Date_)
              Msg_Date_ =  dateFormatterPrint.string(from: datee ?? Date())
        
        return Msg_Date_
    }
    
    
    
}
