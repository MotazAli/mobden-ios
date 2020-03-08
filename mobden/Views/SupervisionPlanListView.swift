//
//  SupervisionPlanListView.swift
//  mobden
//
//  Created by administrator on 3/7/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct SupervisionPlanListView: View {
   
     @ObservedObject var SDModel = SupervisionAndDevelopmentModel()
     var url = "https://mobdenapi.azurewebsites.net/"
     var plansPath = "assets/plans/"
     
     init(){
        self.SDModel.GetManagmentDepartmentPlansByDep()
     }
     
     
     var body: some View{
         
         
         GeometryReader{ geometry in
             VStack{
               NavigationView{
                  VStack{
                      
                    List(self.SDModel.supervisionPlans){ info in
                        
                        
                        NavigationLink(destination: SupervisionPlanInfoView(url: URL(string: self.url + self.plansPath + info.planFile  )!) ){
                            
                            VStack{
                                HStack{
                                        Spacer()
                                    Text(info.linkTitle)
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
                    .navigationBarTitle("خطط الاشراف الجديدة",displayMode: .inline)
                    //.navigationBarHidden(true)
                  }.frame(width: geometry.size.width)
                 
                 
                 
               }
         
         
         
         }//.padding(.top,10)
         
         
         
           }
     
    
}

struct SupervisionPlanListView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionPlanListView()
    }
}
