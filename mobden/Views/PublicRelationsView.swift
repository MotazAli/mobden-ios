//
//  PublicRelationsView.swift
//  mobden
//
//  Created by administrator on 2/29/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct PublicRelationsView: View {
    
     @ObservedObject var publicRelationModel = PublicRelationModel()
     //var url = "https://mobdenapi.azurewebsites.net/"
     //var prizesUrl = "assets/prizes/"
     
     init(){
        self.publicRelationModel.getPublicRelations()
     }
     
     
     var body: some View{
         
         
         GeometryReader{ geometry in
                  
            
             
             VStack{
                 VStack{
                            Text("العلاقات العامه")
                                .font(.headline)
                                .frame(width: 400, height: 50, alignment: .center)
                                .background(Color.gray.opacity(0.5))
                            .cornerRadius(10)
                             .padding([.top,.trailing,.leading],10)
                            }
             
                  NavigationView{
                  
                  
                  VStack{
                      
                    List(self.publicRelationModel.publicRelations){ info in
                        
                        
                        NavigationLink(destination: PublicRelationInfoView(publicRelationID: info.id) ){
                            
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
                                  
                                     
                  }.frame(width: geometry.size.width)
                 
                 
                 
               }
         
         
         
         }//.padding(.top,10)
         
         
         
           }
     
     
    
}

struct PublicRelationsView_Previews: PreviewProvider {
    static var previews: some View {
        PublicRelationsView()
    }
}
