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
 
    
    @Binding var masterSilderOpen: Bool
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
                                        Text("القبول و التسجيل")
                                            .foregroundColor(Color.black)
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
                                        Text("الجوائز")
                                            .foregroundColor(.primary)
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
                                        Text("الجودة الشاملة")
                                            .foregroundColor(.primary)
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
                                        Text("الاشراف و التطوير المهني").fontWeight(.medium)
                                            .foregroundColor(.primary)
                                            .padding(20)
                                            .font(.system(size: 22))
                                        .scaledToFit()
                                        
                                    }
                                    
                                    
                                    
                                    
                                      
                                  }
                                  HStack{
                                    Spacer()
                                    Button(action:{
                                        self.viewName = ViewScreen.publicRelationView
                                        self.isSheetPersented.toggle()
                                    }){
                                        Text("العلاقات العامة")
                                            .foregroundColor(.primary)
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
                                        Text("النقل المدرسي")
                                            .foregroundColor(.primary)
                                            .padding(20)
                                        .font(.title)
                                    }
                                    
                                    
                                    
                                     
                                  }
                                  HStack{
                                    Spacer()
                                      Text("اتصل بنا").padding(20)
                                    .font(.title)
                                  }
                                    Spacer()
                                
                                  }
                                  .frame(width: 270,height:geometry.size.height, alignment: .topLeading)
                                  .background(Color.red.opacity(0.9))
                                  .offset(x: 80)
                                
                                  
                  }
                   
         .background(Color.white.opacity(0.05))
         //.opacity(self.masterSilderOpen ? 0.8 : 0.0)
            .offset(x: self.masterSilderOpen ? 0 : UIScreen.main.bounds.width * 2)
            .animation(Animation.default.speed(1))
            .edgesIgnoringSafeArea(.all)
                  .onTapGesture {
                      self.masterSilderOpen.toggle()
                    //print("tap")
                  }
            .gesture(DragGesture()
                    
                    .onEnded { value in
                       self.masterSilderOpen.toggle()
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

//
//struct MasterMenuSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterMenuSlider(masterSilderOpen: Binding.constant(true))
//    }
//}


