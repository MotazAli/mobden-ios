//
//  RegistrationView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    
    
    @ObservedObject var registrationModel = RegistrationModel()
    
    init(){
        self.registrationModel.getRegistrationFinanace()
    }
    
    
    var body: some View{
        
        
        
        
        
        
        GeometryReader{ geometry in
                 
           
            
            VStack{
                VStack{
                           Text("إجراءات التسجيل للطلاب المستجدين")
                               .font(.headline)
                               .frame(width: 400, height: 50, alignment: .center)
                               .background(Color.gray.opacity(0.5))
                           .cornerRadius(10)
                            .padding([.top,.trailing,.leading],10)
                           }
            
                 ScrollView{
                 
                 
                 VStack{
                     
                     ForEach(self.registrationModel.registerFinances){ finance in
                         
                        VStack(spacing: 5){
                                             HStack{
                                                                        Spacer()
                                                                        
                                            //                            Text(self.getStageName(id: finance.stage))
                                                                        Text(finance.stageName)
                                                                        Text("المرحله")
                                                                            .font(.headline)
                                                                            .frame(width: 100,height:30)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(4)
                                                                        .padding(10)
                                                                    }
                                                                    HStack{
                                                                        Spacer()
                                                                        
                                                                        Text(finance.feesString)
                                                                        Text("الرسوم")
                                                                            .font(.headline)
                                                                        .frame(width: 100,height:30)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(4)
                                                                        .padding(10)
                                                                    }
                                                                    VStack{
                                                                        Text("الملاحظات")
                                                                            .font(.subheadline)
                                                                        .frame(width: 350, height: 30, alignment: .center)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(10)
                                                                        .padding(10)
                                                                        Text(finance.notes)
                                                                            .padding([.bottom], 10)
                                                                        
                                                                    }.padding( 5)
                                             
                        }.frame(width: 400)
                            .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(10)
                                                         
                    }
                     
                                     
                                     
                 }.padding([.trailing,.leading],10)
                     .frame(width:geometry.size.width)
                                 
                                     //.padding([.trailing],30)
                                     //.background(Color.gray.opacity(0.2))
                                // .cornerRadius(15)
                 }.frame(width: geometry.size.width)
                
                
                
                
                

                Spacer()
                Text("ملحوظة هامة : توجد تسهيلات في تسديد الرسوم وذلك بالتنسيق مع الإدارة المالية .")
                
                
                
              }
        
        
        
        
        
        
        
        }.padding(.top,10)
        
        
        
          }
    
    
    
    
    
    
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
