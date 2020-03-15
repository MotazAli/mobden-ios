//
//  PrimarySchoolSliderMenu.swift
//  mobden
//
//  Created by administrator on 2/20/20.
//  Copyright © 2020 motaz. All rights reserved.
//


import Foundation
import SwiftUI



struct PrimarySchoolSliderMenu : View {
 
    @Binding var primarySchoolSliderOpen: Bool
    
       
       @State var viewName : ViewScreen = ViewScreen.noView
       @State var isSheetPersented = false
        let stageId : Int = 1
    @State var departmentId  = 0
    let primaryPlanWorkUrl : String = "https://mobden.azurewebsites.net/pdf/working_plan.pdf"
       var width: CGFloat = 270
       

       
       
       var body: some View{
           
           ZStack{
            GeometryReader { geometry in
                        
               VStack {
                                     Spacer()
                                     HStack{
                                      
                                       
                                       Image("logo").resizable().scaledToFit()
                                           .clipShape(Circle())
                                           .frame(width:200,height:200)
                                       
                                       
                                   
                                       
                                         
                                     }
                                     HStack{
                                       
                                       Spacer()
                                       
                                       Button(action:{
                                        
                                        self.departmentId = 2
                                           self.viewName = ViewScreen.leadership
                                           self.isSheetPersented.toggle()
                                       }){
                                        Text("القيادة المدرسية").fontWeight(.bold)
                                               .foregroundColor(Color.white)
                                               .padding(20)
                                               .font(.title)

                                       }
                                         
                                      }
                                     
                                      HStack{
                                       
                                       Spacer()
                                       Button(action:{
                                           self.viewName = ViewScreen.planWork
                                           self.isSheetPersented.toggle()
                                       }){
                                           Text("الخطة التشغيلية").fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                               .padding(20)
                                           .font(.title)
                                       }
                                       
                                       
                                          
                                      }
                                     HStack{
                                       
                                       Spacer()
                                       Button(action:{
                                        self.departmentId = 4
                                        self.viewName = ViewScreen.studentSupervisionView
                                           self.isSheetPersented.toggle()
                                        
                                       }){
                                           Text("الإرشاد الطلابي").fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                               .padding(20)
                                           .font(.title)
                                       }
                                       
                                        
                                     }
                                     HStack{
                                       Spacer()
                                       Button(action:{
                                           self.viewName = ViewScreen.supervisionView
                                           self.isSheetPersented.toggle()
                                       }){
                                           Text("النشاط الطلابي").fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                               .padding(20)
                                               .font(.title)
                                           .scaledToFit()
                                           
                                       }
                                       
                                       
                                       
                                       
                                         
                                     }
                                     HStack{
                                       Spacer()
                                       Button(action:{
                                           self.viewName = ViewScreen.publicRelationView
                                           self.isSheetPersented.toggle()
                                       }){
                                           Text("المصادر والمعامل").fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                               .padding(20)
                                           .font(.title)
                                       }
                                       
                                       
                                       
                                     }
                                     HStack{
                                       Spacer()
                                       
                                       Button(action:{
                                           self.viewName = ViewScreen.transferView
                                           self.isSheetPersented.toggle()
                                       }){
                                           Text("الواجبات المدرسية").fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                               .padding(20)
                                           .font(.title)
                                       }
                                       
                                       
                                       
                                        
                                     }
//                                     HStack{
//                                       Spacer()
//                                         Text("اتصل بنا").padding(20)
//                                       .font(.title)
//                                     }
                                       Spacer()
                                   
                                     }
                                     .frame(width: 270,height:geometry.size.height, alignment: .topLeading)
                                     .background(Color.blue.opacity(0.9))
                                     .offset(x: 80)
                                   
                                     
                     }
                      
            .background(Color.white.opacity(0.05))
            //.opacity(self.masterSilderOpen ? 0.8 : 0.0)
                .offset(x: self.primarySchoolSliderOpen ? 0 : UIScreen.main.bounds.width * 2)
               .animation(Animation.default.speed(1))
               .edgesIgnoringSafeArea(.all)
                     .onTapGesture {
                        self.primarySchoolSliderOpen.toggle()
                       //print("tap")
                     }
               .gesture(DragGesture()
                       
                       .onEnded { value in
                        self.primarySchoolSliderOpen.toggle()
                           //print("drag")
                       }
               )
               
           
           }.sheet(isPresented: self.$isSheetPersented){
               
               //ArticleView(articleID: 65)
            VStack{
                
                if self.viewName == ViewScreen.planWork{
                    VStack{
                            Button(action: {self.isSheetPersented.toggle()}){
                            Text("اغلاق").font(.headline)
                                .frame(width: 400, height: 50)
                                .background(Color.gray.opacity(0.5))
                            .cornerRadius(10)
                             .padding([.top,.trailing,.leading],10)
                    
                        }
                            
                        }
                }
                
                self.getViewByID(viewScreen: self.viewName)
            }
               
           }
           
       }
       
       
       
       
       
       func getViewByID(viewScreen: ViewScreen) -> AnyView {
           if viewScreen == ViewScreen.leadership {
            return AnyView( LeadershipView(stageId: self.stageId,departmentId: self.departmentId))
                          
           }
           else if viewScreen == ViewScreen.planWork {
            return AnyView( PlanInfoView(url: URL(string: self.primaryPlanWorkUrl)!))
                          
           }
               else if viewScreen == ViewScreen.studentSupervisionView {
            return AnyView( StudentSupervisionView(stageId: self.stageId,departmentId: self.departmentId))
                              
               }
               else if viewScreen == ViewScreen.supervisionView {
                   return AnyView( SupervisionView())
                              
               }
           else if viewScreen == ViewScreen.comprehensiveView {
                   return AnyView( ComprehensiveView())
                              
               }
               else if viewScreen == ViewScreen.transferView {
                              return AnyView( TransferView())
                                         
                          }
           else{
               return AnyView( EmptyView())
           }
           
       }
       
       
       
       
      
    
}


struct PrimarySchoolSliderMenu_Previews: PreviewProvider {
    static var previews: some View {
        PrimarySchoolSliderMenu(primarySchoolSliderOpen: Binding.constant(true))
    }
}



