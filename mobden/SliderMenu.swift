//
//  SliderMenu.swift
//  mobden
//
//  Created by administrator on 2/20/20.
//  Copyright © 2020 motaz. All rights reserved.
//
import  Foundation
import SwiftUI
import Combine




struct MasterMenuSlider : View {
 
    @ObservedObject var registrationModel = RegistrationModel()
    @Binding var masterSilderOpen: Bool
    @State var viewName : ViewScreen = ViewScreen.noView
    @State var isSheetPersented = false
    var width: CGFloat = 270
    
//
//    func show(){
//        self.registrationModel.getRegistrationFinanace()
//    }
    
    
    var body: some View{
        
        ZStack{
         GeometryReader { geometry in
                     
            VStack(alignment: .trailing) {
                                  
                                  HStack{
                                    Spacer()
                                    
                                   
                                    
                                      Text("الرئيسية")
                                    .padding(20)
                                        .font(.title)
                                
                                    
                                      
                                  }
                                  HStack{
                                    
                                    
                                    
                                    Button(action:{
                                        self.viewName = ViewScreen.registrationView
                                        self.isSheetPersented.toggle()
                                    }){
                                        Text("القبول و التسجيل")
                                            .foregroundColor(Color.black)
                                            .padding(20)
                                            .font(.title)

                                    }
                                      
                                   }
                                  
                                   HStack{
                                    
                                    
                                    Button(action:{
                                        self.viewName = ViewScreen.prizesView
                                        self.isSheetPersented.toggle()
                                    }){
                                        Text("الجوائز")
                                            .foregroundColor(.primary)
                                            .padding(20)
                                        .font(.title)
                                    }
                                    
                                    
                                       
                                   }
                                  HStack{
                                      Text("الجودة الشاملة").padding(20)
                                    .font(.title)
                                  }
                                  HStack{
                                    
                                    Button(action:{
                                        self.viewName = ViewScreen.supervisionView
                                        self.isSheetPersented.toggle()
                                    }){
                                        Text("الاشراف و التطوير المهني")
                                            .foregroundColor(.primary)
                                            .padding(20)
                                        .font(.system(size: 25))
                                        .scaledToFit()
                                        
                                    }
                                    
                                    
                                    
                                    
                                      
                                  }
                                  HStack{
                                    
                                    Button(action:{
                                        self.viewName = ViewScreen.publicRelation
                                        self.isSheetPersented.toggle()
                                    }){
                                        Text("العلاقات العامة")
                                            .foregroundColor(.primary)
                                            .padding(20)
                                        .font(.title)
                                    }
                                    
                                    
                                    
                                  }
                                  HStack{
                                      Text("النقل المدرسي").padding(20)
                                    .font(.title)
                                  }
                                  HStack{
                                      Text("اتصل بنا").padding(20)
                                    .font(.title)
                                  }
                                  
                                
                                  }
                                  .frame(width: 270,height:geometry.size.height, alignment: .topLeading)
                                  .background(Color.red)
                                  .offset(x: 80)
                                  
                                  
                  }
                   
                  .background(Color.gray.opacity(0.3))
         .opacity(self.masterSilderOpen ? 0.8 : 0.0)
                  .animation(Animation.easeIn.delay(0.25))
            .edgesIgnoringSafeArea(.bottom)
                  .onTapGesture {
                      self.masterSilderOpen.toggle()
                  }
            
        
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
            else if viewScreen == ViewScreen.publicRelation {
                return AnyView( PublicRelationsView())
                           
            }
            else if viewScreen == ViewScreen.supervisionView {
                return AnyView( SupervisionView())
                           
            }
        else{
            return AnyView( EmptyView())
        }
        
    }
    
    
    
    
    
    
}

//
//struct MasterMenuSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterMenuSlider(masterSilderOpen: Binding.constant(true))
//    }
//}


