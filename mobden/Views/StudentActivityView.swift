//
//  StudentActivityView.swift
//  mobden
//
//  Created by administrator on 3/15/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct StudentActivityView: View {
     @State var spin = false
                @State var imageTransation = false
                @State var shaked = false
                @State var selectedTab : Int = 1
        var stageId : Int
        var departmentId:Int
                 //var url = "https://mobdenapi.azurewebsites.net/"
                 //var prizesUrl = "assets/prizes/"
                 
            //     init(){
            //        self.supervisionAndDevelopmentModel.getAboutSupervisions()
            //     }
                 
                 
                 var body: some View{
                     
                    
                     GeometryReader{ geometry in
                        //NavigationView{
                         VStack{
                             // NavigationView{
                                
                            
                            VStack{
                                
                                if self.selectedTab == 1 {
                                    ZStack{
                                        StudentActivityListView(stageId: self.stageId,departmentId: self.departmentId)
                                    }
                                    .padding(.top,100)
                                }
                                
        //                        else if self.selectedTab == 2 {
        //                            ZStack{
        //                                SupervisionTeamView()
        //                            }
        //                            .padding(.top,120)
        //                        }
                                else if self.selectedTab == 3{
                                   ZStack{
                                    StudentSupervisionPlanListView(stageId: self.stageId, departmentId: self.departmentId)
                                    }
                                    .padding(.top,100)
                                }
                                
                                
                                //Color.red
                            }.frame(width:geometry.size.width,height: geometry.size.height / 1)
                            
                            HStack{
                                
                                HStack{
                                    VStack(alignment:.center){
                                       //VStack(alignment:.center){

                                                //VStack{
                                                    
                                                    Image(systemName: "pencil.and.ellipsis.rectangle")
                                                    .resizable()
                                                    .scaledToFit()
                                                            .frame(width:60 , height: 40)
                                                        .offset(x: self.shaked ? -5 : 0)
                                                        .animation(Animation.easeInOut.repeatForever().speed(1))
                                        Text("خطط النشاط").fontWeight(.medium).fixedSize()
                                                //}
                                                
                                        //Spacer()

                                          //  }
                                    }.frame(width:(geometry.size.width / 2))
                                    .padding(.bottom,100)
                                        
                                        //.border(self.selectedTab == 3 ? Color.orange : Color.white , width: 4)
                                     .foregroundColor(self.selectedTab == 3 ? .black : .gray)
                                     .onTapGesture {
                                            self.selectedTab = 3
                                    }
                                    .onAppear(){
                                                self.shaked = true
                                    }
                                    
                                    
                                    VStack(alignment: .center){
                                        //VStack(alignment:.center){
                                        //Spacer()
                                                if self.imageTransation {
                                                Image(systemName:"square.and.pencil")// : "bubble.left.fill")
                                                                            .resizable()
                                                                            .scaledToFit()
                                                                                    .frame(width:60 , height: 40)
                                                    .transition(.repeating(from: Opacity(0), to: Opacity(1)))
                                                                                
                                                
                                                }
                                        Text("النشاط الطلابي").fontWeight(.medium)//.frame(width:100)
                                                 
                                            //}.onAppear(){self.imageTransation = true }
                                        
                                        //Spacer()
                                        
                                    }.frame(width:(geometry.size.width / 2))
                                    .padding(.bottom,100)
                                    
                                    //.border(self.selectedTab == 1 ? Color.orange : Color.white , width: 4)
                                    .foregroundColor(self.selectedTab == 1 ? .black : .gray)
                                    .onTapGesture {
                                            self.selectedTab = 1
                                    }
                                    .onAppear(){self.imageTransation = true }
                                    
                                }
                            }.frame(width:geometry.size.width,height: (geometry.size.height / 4) )
                            .background(Color.white.shadow(radius: 2))
                               
                             
                             
                             
                           }.frame(width: geometry.size.width,height: geometry.size.height  )
                     
                   
                           
                    }
                       }
                 
            
            
            
        }







    struct StudentActivityListView: View {
        
         @ObservedObject var SAModel = StudentActivityModel()
        //@ObservedObject var DLModel = DepartmentLeaderModel()
         let url = "https://mobdenapi.azurewebsites.net/"
         let studentActivityUrl = "assets/studentactivities/"
         
        init(stageId:Int,departmentId:Int){
            self.SAModel.getStudentActivityBy(stageId: stageId)
            //self.DLModel.getStageDepartmentLeaderByStageAndDep(stageId: stageId, departmentId: departmentId)
         }
         
         
         var body: some View{
             
             
             GeometryReader{ geometry in
                 VStack{
                    
                    
                    
    //                VStack{
    //                    ForEach(self.DLModel.departmentLeaderList){ info in
    //                        HStack{
    //                            //Spacer()
    //                            VStack{
    //                                Text(info.name)
    //                                 //.padding(8)
    //                                //.flipsForRightToLeftLayoutDirection(true)
    //                                   .lineSpacing(2)
    //                                .multilineTextAlignment(.trailing)
    //                                Text(info.phone)
    //                                 //.padding(8)
    //                                //.flipsForRightToLeftLayoutDirection(true)
    //                                   .lineSpacing(2)
    //                                .multilineTextAlignment(.trailing)
    //
    //                            }
    //
    //
    //                            UrlImageView(urlString:(self.url + self.personUrl + info.image),width: 100,height: 100)
    //                                .cornerRadius(8)
    //                            .padding(8)
    //
    //
    //                        }
    //
    //                    }
    //                }.background(Color.gray.opacity(0.12))

                    
                    
                    
                    
                   NavigationView{

                    
                    
                    
                    
                    
                      VStack{
                          
                        List(self.SAModel.studentActivitiesList){ info in
                            
                            
                            NavigationLink(destination: StudentActivityInfoView(id: info.id) ){
                                
                                VStack{
                                    HStack{
                                            Spacer()
                                            Text(info.title)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                        UrlImageView(urlString:(self.url + self.studentActivityUrl + info.image),width: 100,height: 100)
                                                                        .cornerRadius(8)
                                                                    .padding(8)
                                                                      
                                          }.frame(alignment:.top)
                                                              
                                      }.frame(height:120)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(8)
                                
                                
                            }
                            
                                                              
                         }
                          
                                          
                                          
                      }//.padding([.trailing,.leading],10)
                          .frame(width:geometry.size.width)
                        .navigationBarTitle("النشاط الطلابي",displayMode: .inline)
                        //.navigationBarHidden(true)
                      }.frame(width: geometry.size.width)
                     
                     
                     
                   }
             
             
             
             }//.padding(.top,10)
             
             
             
               }
         
        
    }




    struct StudentActivityInfoView: View {
        @ObservedObject var SAModel = StudentActivityModel() //ArticleModel(getArticleByID:)
            var url = "https://mobdenapi.azurewebsites.net/"
            let studentActivityUrl = "assets/studentactivities/"
            
            init(id: Int) {
                
                //self.articleModel = ArticleModel()
                self.SAModel.GetStudentActivityBy(id: id)
            }
            
            var body: some View {
                
                GeometryReader{ geometry in
                
                ScrollView{
                
                
                VStack{
                    
                    //ForEach(self.articleModel.articles){ article in
                        
                                            VStack{
                                             HStack{
                                                 Spacer()
                                                Text(self.SAModel.studentActivityInfo.arabicDate)
                                                 .padding([.trailing],5)
                                                 //.flipsForRightToLeftLayoutDirection(true)
                                             }
                                             HStack{
                                                 Spacer()
                                                Text(self.SAModel.studentActivityInfo.title)
                                                     //.flipsForRightToLeftLayoutDirection(true)
                                                     .font(.headline)
                                                     .multilineTextAlignment(.trailing)
                                                     .lineLimit(3)
                                                     .padding([.trailing],5)
                                                     //.alignmentGuide(.trailing){d in d[.trailing]}
                                                 
                                             }
                                             
                            
                            
                                            }
                                            
                                           // VStack{
                    UrlImageView(urlString:(self.url + self.studentActivityUrl + self.SAModel.studentActivityInfo.image),width: 400,height: 300)
                     
                     
                                            
                     //VStack{
                    Text(self.SAModel.studentActivityInfo.description)
                             //.flipsForRightToLeftLayoutDirection(true)
                             .font(.body)
                            //.padding()
                        //.flipsForRightToLeftLayoutDirection(true)
                             .lineSpacing(5)
                                           //.fixedSize(horizontal: false, vertical: true)
                             .multilineTextAlignment(.trailing)
                            .padding(10)
                             //.lineLimit(Int.max)

                    //}
                                            
                      
                                                        
                    //}
                    
                                    
                                    
                }//.padding(10)
                    //.frame(width:geometry.size.width )
                                
                                    //.padding([.trailing],30)
                    .background(Color.gray.opacity(0.2))
                               // .cornerRadius(15)
                }.frame(width: geometry.size.width - 20)
                }
        .navigationBarTitle("توضيح",displayMode: .inline)
            }
    }



    struct StudentActivityPlanListView: View {
       
         @ObservedObject var SDModel = SupervisionAndDevelopmentModel()
         var url = "https://mobdenapi.azurewebsites.net/"
         var plansPath = "assets/plans/"
         
        init(stageId:Int , departmentId:Int){
            self.SDModel.GetStageDepartmentPlanBy(stageId: stageId, departmentId: departmentId)
         }
         
         
         var body: some View{
             
             
             GeometryReader{ geometry in
                 VStack{
                   NavigationView{
                      VStack{
                          
                        List(self.SDModel.supervisionPlans){ info in
                            
                            
                            NavigationLink(destination: PlanInfoView(url: URL(string: self.url + self.plansPath + info.planFile  )!) ){
                                
                                VStack{
                                    HStack{
                                            Spacer()
                                        Text(info.linkTitle)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                                                      
                                          }.frame(alignment:.top)
                                                              
                                      }.frame(height:100)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(8)
                                
                                
                            }
                            
                                                              
                         }
                          
                                          
                                          
                      }//.padding([.trailing,.leading],10)
                          .frame(width:geometry.size.width)
                        .navigationBarTitle("خطط الارشاد الجديدة",displayMode: .inline)
                        //.navigationBarHidden(true)
                      }.frame(width: geometry.size.width)
                     
                     
                     
                   }
             
             
             
             }//.padding(.top,10)
             
             
             
               }
         
        
    }





struct StudentActivityView_Previews: PreviewProvider {
    static var previews: some View {
        StudentActivityView(stageId: 0, departmentId: 0)
    }
}
