//
//  SupervisionListView.swift
//  mobden
//
//  Created by administrator on 3/5/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct SupervisionListView: View {
    
     @ObservedObject var SDModel = SupervisionAndDevelopmentModel()
     //var url = "https://mobdenapi.azurewebsites.net/"
     //var prizesUrl = "assets/prizes/"
     
     init(){
        self.SDModel.getAboutSupervisions()
     }
     
     
     var body: some View{
         
         
         GeometryReader{ geometry in
             VStack{
               NavigationView{
                  VStack{
                      
                    List(self.SDModel.supervisionAndDevelopments){ info in
                        
                        
                        NavigationLink(destination: SupervisionInfoView(id: info.id) ){
                            
                            VStack{
                                HStack{
                                        Spacer()
                                        Text(info.title)
                                        .padding(8)
                                        .flipsForRightToLeftLayoutDirection(true)
                                        .lineSpacing(2)
                                        .multilineTextAlignment(.trailing)
                                                                  
                                      }.frame(alignment:.top)
                                                          
                                  }.frame(height:100)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            
                            
                        }
                        
                                                          
                     }
                      
                                      
                                      
                  }//.padding([.trailing,.leading],10)
                      .frame(width:geometry.size.width)
                    .navigationBarTitle("الاشراف والتطوير المهنى",displayMode: .inline)
                    //.navigationBarHidden(true)
                  }.frame(width: geometry.size.width)
                 
                 
                 
               }
         
         
         
         }//.padding(.top,10)
         
         
         
           }
     
    
}

struct SupervisionListView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionListView()
    }
}
