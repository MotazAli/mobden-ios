//
//  LeadershipView.swift
//  mobden
//
//  Created by administrator on 3/14/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct LeadershipView: View {
    @ObservedObject var LModel = LeadershipModel()
    @ObservedObject var DLModel = DepartmentLeaderModel()
         var url = "https://mobdenapi.azurewebsites.net/"
         var personUrl = "assets/persons/"
         
    init(stageId:Int , departmentId: Int){
            self.LModel.getLeadershipByStage(id: stageId)
        self.DLModel.getStageDepartmentLeaderByStageAndDep(stageId: stageId, departmentId: departmentId)
         }
         
         
         var body: some View{
             
             
             //GeometryReader{ geometry in
                      
                
                 
                 //VStack{
                    
                      //NavigationView{
                        
                        
                        
                      
                      VStack{
                        
                        VStack{
                        Text("القيادة المدرسية")
                            .font(.headline)
                            .frame(width: 400, height: 50, alignment: .center)
                            .background(Color.blue.opacity(0.5))
                        .cornerRadius(10)
                         .padding([.top,.trailing,.leading],10)
                            ForEach(self.DLModel.departmentLeaderList){ info in
                                HStack{
                                    //Spacer()
                                    VStack{
                                        Text(info.name)
                                         //.padding(8)
                                        //.flipsForRightToLeftLayoutDirection(true)
                                           .lineSpacing(2)
                                        .multilineTextAlignment(.trailing)
                                        Text(info.phone)
                                         //.padding(8)
                                        //.flipsForRightToLeftLayoutDirection(true)
                                           .lineSpacing(2)
                                        .multilineTextAlignment(.trailing)
                                        
                                    }
                                    
                                    
                                    UrlImageView(urlString:(self.url + self.personUrl + info.image),width: 100,height: 100)
                                        .cornerRadius(8)
                                    .padding(8)
                                    
                                    
                                }
                                
                            }
                        }.background(Color.gray.opacity(0.12))
                        
                        
                        
                          
                        List(self.LModel.leadershipList){ info in
                            
                            
                            //NavigationLink(destination: PublicRelationInfoView(publicRelationID: info.id) ){
                                
                                VStack{
                                    HStack{
                                        
                                        Spacer()
                                        
                                        VStack{
                                            HStack{
                                                Spacer()
                                                Text(info.name)
                                                //.padding(8)
//                                                .flipsForRightToLeftLayoutDirection(true)
                                                .lineSpacing(2)
                                                .multilineTextAlignment(.trailing)
                                                Text("الاسم :")
                                                
                                            }
                                            HStack{
                                                Spacer()
                                                Text(info.job).foregroundColor(.secondary)
                                                    
                                                //.padding(8)
//                                                .flipsForRightToLeftLayoutDirection(true)
                                                .lineSpacing(2)
                                                .multilineTextAlignment(.trailing)
                                                Text("الوظيفة :")
                                            }
                                            HStack{
                                                   Spacer()
                                                                                   
                                                                                   
                                                    Text(info.councilStatusName)
                                                        .foregroundColor(.secondary)
                                                    //.padding(8)
                                                    //.flipsForRightToLeftLayoutDirection(true)
                                                    .lineSpacing(2)
                                                    .multilineTextAlignment(.trailing)
                                                    Text("صفته :")
                                                                                   
                                                                               
                                            }
//                                            Text(info.name)
//                                            .padding(8)
//                                            .flipsForRightToLeftLayoutDirection(true)
//                                            .lineSpacing(2)
//                                            .multilineTextAlignment(.trailing)
//                                            Text(info.job)
//                                                .foregroundColor(.secondary)
//                                            .padding(8)
//                                            .flipsForRightToLeftLayoutDirection(true)
//                                            .lineSpacing(2)
//                                            .multilineTextAlignment(.trailing)
                                            
                                        }
                                        UrlImageView(urlString:(self.url + self.personUrl + info.image),width: 100,height: 100)
                                            .cornerRadius(8)
                                        .padding(8)
                                        
                                                                      
                                          }
                                   
                                                              
                                }.frame(height:110)
                                        .background(Color.blue.opacity(0.12))
                                        .cornerRadius(8)
                                    //.padding(.trailing,10)
                                
                                
                            //}
                            
                              
                           
                                                                          
                                                                  
                            
                                                              
                         }
                          
                                          
                                          
                      }//.padding([.trailing,.leading],10)
                          //.frame(width:geometry.size.width)
                        //.navigationBarTitle("فريق العمل",displayMode: .inline)
                        //.navigationBarHidden(true)
                      //}.frame(width: geometry.size.width)
                     
                     
                     
                   //}
             
             
             
             //}//.padding(.top,10)
    //         .navigationBarItems(leading: NavigationLink(destination: SupervisionView()) {
    //                 Text("Nav")
    //                 }
    //         )
             
             
               }
         
        
}

struct LeadershipView_Previews: PreviewProvider {
    static var previews: some View {
        LeadershipView(stageId: 0,departmentId: 0)
    }
}
