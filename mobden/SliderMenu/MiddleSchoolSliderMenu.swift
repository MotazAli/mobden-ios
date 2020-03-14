//
//  MiddleSchoolSliderMenu.swift
//  mobden
//
//  Created by administrator on 3/13/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct MiddleSchoolSliderMenu: View {
      @Binding var middleSchoolSliderOpen: Bool
        
           
           @State var viewName : ViewScreen = ViewScreen.noView
           @State var isSheetPersented = false
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
                                               self.viewName = ViewScreen.registrationView
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
                                               self.viewName = ViewScreen.prizesView
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
                                               self.viewName = ViewScreen.comprehensiveView
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
                    .offset(x: self.middleSchoolSliderOpen ? 0 : UIScreen.main.bounds.width * 2)
                   .animation(Animation.default.speed(1))
                   .edgesIgnoringSafeArea(.all)
                         .onTapGesture {
                            self.middleSchoolSliderOpen.toggle()
                           //print("tap")
                         }
                   .gesture(DragGesture()
                           
                           .onEnded { value in
                            self.middleSchoolSliderOpen.toggle()
                               //print("drag")
                           }
                   )
                   
               
               }.sheet(isPresented: self.$isSheetPersented){
                   
                   //ArticleView(articleID: 65)
                   self.getViewByID(viewScreen: self.viewName)
               }
               
           }
           
           
           
           
           
           func getViewByID(viewScreen: ViewScreen) -> AnyView {
               if viewScreen == ViewScreen.registrationView {
                   return AnyView( RegistrationView())
                              
               }
               else if viewScreen == ViewScreen.prizesView {
                   return AnyView( PrizesView())
                              
               }
                   else if viewScreen == ViewScreen.publicRelationView {
                       return AnyView( PublicRelationsView())
                                  
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

struct MiddleSchoolSliderMenu_Previews: PreviewProvider {
    static var previews: some View {
        MiddleSchoolSliderMenu(middleSchoolSliderOpen: Binding.constant(true))
    }
}
