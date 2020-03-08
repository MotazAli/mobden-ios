//
//  RegistrationView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    //@ObservedObject var supervisionAndDevelopmentModel = SupervisionAndDevelopmentModel()
        @State var spin = false
        @State var imageTransation = false
        @State var shaked = false
        @State var selectedTab : Int = 1
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
                                RegistrationInfoView()
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
                                EmptyView()
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
                                Text("خطط الاشراف").fontWeight(.medium)
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
                            
                            
//                            VStack(alignment:.center){
//                                //VStack(alignment:.center){
//                                    //VStack{
//                                        Image(systemName: "gear")
//                                        .resizable()
//                                        .scaledToFit()
//                                                .frame(width:60 , height:40)
//                                            .rotationEffect(.degrees(self.spin ? 360: 0))
//                                        //.offset(x: 20, y: 200)
//                                            //.animation(Animation.spring().repeatForever(autoreverses:false))
//                                            .onAppear(){
//                                             //DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                                                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
//                                                     self.spin = true
//                                                 }
//                                             //}
//
//                                        }
//                                    //}
//
//                                    Text("فريق العمل").fontWeight(.medium)
//                                        //.multilineTextAlignment(.center).lineLimit(2)
//
//                                 Spacer()
//
//                                //}
//                            }.frame(width:(geometry.size.width / 3))
//                                .padding(.top,10)
//                            //.border(self.selectedTab == 2 ? Color.orange : Color.white , width: 4)
//                            .foregroundColor(self.selectedTab == 2 ? .black : .gray)
//                            .onTapGesture {
//                                    self.selectedTab = 2
//                            }
                            
                            
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
                                Text("إجراءات التسجيل").fontWeight(.medium)//.frame(width:100)
                                         
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
                       
                        
                         
                        
                        
                      
                     // }.frame(width: geometry.size.width,height: geometry.size.height)
                     
                     
                     
                   }.frame(width: geometry.size.width,height: geometry.size.height  )
             
             //.navigationBarTitle("رئيسي",displayMode: .inline)
                        //.navigationBarHidden(true)
             
             //}.frame(width: geometry.size.width,height: geometry.size.height)//.padding(.top,10)
             
                   
            }
               }
         
    
    
    
}











struct RegistrationInfoView: View {
    
    
    
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
                    .multilineTextAlignment(.trailing)
                
                
                
              }
        
        
        
        
        
        
        
        }.padding(.top,10)
        
        
        
          }
    
    
    
    
    
    
}














struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
