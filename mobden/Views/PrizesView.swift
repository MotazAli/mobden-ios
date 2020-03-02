//
//  PrizesView.swift
//  mobden
//
//  Created by administrator on 2/29/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct PrizesView: View {
   
    @ObservedObject var prizeModel = PrizesModel()
    var url = "https://mobdenapi.azurewebsites.net/"
    var prizesUrl = "assets/prizes/"
    
    init(){
        self.prizeModel.getPrizes()
    }
    
    
    var body: some View{
        
        
        
        
        
        
        GeometryReader{ geometry in
                 
           
            
            VStack{
                VStack{
                           Text("الجوائز التي حصلت عليها المدرسة")
                               .font(.headline)
                               .frame(width: 400, height: 50, alignment: .center)
                               .background(Color.gray.opacity(0.5))
                           .cornerRadius(10)
                            .padding([.top,.trailing,.leading],10)
                           }
            
                 ScrollView{
                 
                 
                 VStack{
                     
                     ForEach(self.prizeModel.prizes){ prize in
                         
                        VStack(spacing: 5){
                                             
                                                                    VStack{
                                                                        
                                                                        
                                                                        UrlImageView(urlString:(self.url + self.prizesUrl + prize.image),width: 230,height: 200)
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        Text(prize.description)
                                                                            .padding([.bottom], 10) .flipsForRightToLeftLayoutDirection(true)
                                                                        
                                                                        .lineSpacing(5)
                                                                        .multilineTextAlignment(.trailing)
                                                                        
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
                
                
                
                
               
                
                
              }
        
        
        
        
        
        
        
        }.padding(.top,10)
        
        
        
          }
    
    
    
    
}

struct PrizesView_Previews: PreviewProvider {
    static var previews: some View {
        PrizesView()
    }
}
