//
//  SliderMenu.swift
//  mobden
//
//  Created by administrator on 2/20/20.
//  Copyright © 2020 motaz. All rights reserved.
//
import  Foundation
import SwiftUI




struct MasterMenuSlider : View {
 
    @Binding var masterSilderOpen: Bool
    @State var isRegisterationViewPersented = false
    let width: CGFloat = 270
    
    
    
    
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
                                        self.isRegisterationViewPersented.toggle()
                                    }){
                                        Text("القبول و التسجيل")
                                            .foregroundColor(Color.black)
                                            .padding(20)
                                            .font(.title)
                                        
                                    }.sheet(isPresented: self.$isRegisterationViewPersented){
                                        RegistrationView()
                                    }
                                      
                                   }
                                  
                                   HStack{
                                       Text("الجوائز").padding(20)
                                    .font(.title)
                                   }
                                  HStack{
                                      Text("الجودة الشاملة").padding(20)
                                    .font(.title)
                                  }
                                  HStack{
                                      Text("الاشراف و التطوير المهني").padding(20)
                                        .font(.system(size: 25))
                                    .scaledToFit()
                                  }
                                  HStack{
                                      Text("العلاقات العامة").padding(20)
                                    .font(.title)
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
            
        
        }
        
    }
    
    
}


struct MasterMenuSlider_Previews: PreviewProvider {
    static var previews: some View {
        MasterMenuSlider(masterSilderOpen: Binding.constant(true))
    }
}


