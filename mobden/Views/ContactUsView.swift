//
//  ContactUsView.swift
//  mobden
//
//  Created by administrator on 3/18/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct ContactUsView: View {
     
        
        @ObservedObject var CModel = ContactModel()
        
        init(){
            self.CModel.getAllContactUsData()
        }
        
        
        var body: some View{
            
            
            
            
            
            
            GeometryReader{ geometry in
                     
               
                
                VStack{
                    VStack{
                               Text("اتصل بنا")
                                   .font(.headline)
                                   .frame(width: 400, height: 50, alignment: .center)
                                   .background(Color.gray.opacity(0.5))
                               .cornerRadius(10)
                                .padding([.top,.trailing,.leading],10)
                               }
                
                     ScrollView{
                     
                     
                     VStack{
                         
                         ForEach(self.CModel.contactList){ info in
                             
                            VStack(spacing: 5){
                                
                                Text(info.title).padding()
                                
                                if info.mobile1 != "" {
                                    HStack{
                                             Spacer()
                                        
                                        Button(action:{
                                            
                                            let urlPhone = URL(string:"tel://" + info.mobile1)
                                            UIApplication.shared.open(urlPhone!)
                                            
                                        }){
                                             Text(info.mobile1)
                                        }
                                                                                                               
                                            
                                              Image(systemName:"phone.fill")
                                              .resizable()
                                              .scaledToFit()
                                               .frame(width:40 , height: 30)
                                              .padding(8)
                                            }
                                }
                                
                                if info.mobile2 != ""{
                                    HStack{
                                            Spacer()
                                                                                                               
                                            
                                        Button(action:{
                                            
                                            let urlPhone = URL(string:"tel://" + info.mobile2)
                                            UIApplication.shared.open(urlPhone!)
                                            
                                        }){
                                             Text(info.mobile2)
                                        }
                                            Image(systemName:"phone.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:40 , height: 30)
                                            .padding(8)
                                           }
                                }
                                                
                                                                       
                                                                        
                                                 
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
                    
                    
                    
                    
                  }
            
            
            
            
            
            
            
            }.padding(.top,10)
            
            
            
              }
        
        
        
        
        
        
    }




struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
