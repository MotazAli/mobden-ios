//
//  SupervisionView.swift
//  mobden
//
//  Created by administrator on 3/3/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct SupervisionView: View {
    
     @ObservedObject var supervisionAndDevelopmentModel = SupervisionAndDevelopmentModel()
    @State var spin = false
     //var url = "https://mobdenapi.azurewebsites.net/"
     //var prizesUrl = "assets/prizes/"
     
     init(){
        self.supervisionAndDevelopmentModel.getAboutSupervisions()
     }
     
     
     var body: some View{
         
        NavigationView{
         GeometryReader{ geometry in
             VStack{
                 // NavigationView{
                    
                    VStack(alignment:.center){
                        
                        
                            Image(systemName: "text.bubble.fill")
                        .resizable()
                        .scaledToFit()
                                .frame(width:80 , height: 60)
                            Text("الاشراف والتطوير المهنى")
                      
                        
                        
                        
                        
                        
                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.gray)
                    VStack(alignment:.center){
                        Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                                .frame(width:80 , height: 60)
                            .rotationEffect(.degrees(self.spin ? 360: 0))
                            .animation(Animation.linear(duration:1 ).repeatForever(autoreverses:false))
                            .onAppear(){
                                self.spin = true
                        }
                        Text("فريق العمل بقسم الاشراف والتطوير المهني")
                        
                        
                        
                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.orange)
                    
                    VStack(alignment:.center){

                        VStack{
                            
                            Image(systemName: "pencil.and.ellipsis.rectangle")
                            .resizable()
                            .scaledToFit()
                                    .frame(width:80 , height: 60)
                            Text("خطط الاشراف الجديدة")
                        }
                        



                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.green)
                    
                    
                    
                  
                 // }.frame(width: geometry.size.width,height: geometry.size.height)
                 
                 
                 
               }.frame(width: geometry.size.width,height: geometry.size.height)
         
         
         
         }//.padding(.top,10)
         
         
        }
           }
     
    
}

struct SupervisionView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionView()
    }
}
