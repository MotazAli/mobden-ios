//
//  HonorBoardView.swift
//  mobden
//
//  Created by administrator on 3/17/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct HonorBoardView: View {
   @State var isArticleViewPersented = false
            @State var honorBoardID : Int = 0
            @ObservedObject var HBModel = HonorBoardModel()
            var url = "https://mobdenapi.azurewebsites.net/"
            var honorBoardUrl = "assets/honorBoards/"
        
            
        init(stageId:Int) {
                //self.articleModel = ArticleModel()
            self.HBModel.getHonorBoardByStageID(stageId:stageId)
               
        }
            
            
            var body: some View {
               // NavigationView{
                List(self.HBModel.honorBoardStageList){ info in
                        
                        
                        Button(action: {
                            
                            self.honorBoardID = info.id
                            self.isArticleViewPersented.toggle()
                            
                        }){
                            
                            

                                            
                                            VStack{
                                                VStack{
                                                    HStack{
                                                        Spacer()
                                                        Text(info.arabicDate)
                                                        .padding([.trailing],5)
                                                        //.flipsForRightToLeftLayoutDirection(true)
                                                    }
                                                    HStack{
                                                        Spacer()
                                                        Text(info.studentFullName)
                                                            //.flipsForRightToLeftLayoutDirection(true)
                                                            .font(.headline)
                                                            .multilineTextAlignment(.trailing)
                                                            .lineLimit(3)
                                                            .padding([.trailing],5)
                                                            //.alignmentGuide(.trailing){d in d[.trailing]}
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                                //VStack{
                                                    UrlImageView(urlString:(self.url + self.honorBoardUrl + info.image),width: 330,height: 300)                    //}.padding([.trailing],10)


                                                
                                                
                                                
                            //                        Image("company_logo")
                            //                        .resizable()
                            //                        .scaledToFit()
                            //                            .frame( height: 300)
                                                
                                                VStack{
                                                    Text(info.description)
                                                    //.flipsForRightToLeftLayoutDirection(true)
                                                        //.padding(4)
                                                    .multilineTextAlignment(.trailing)
                                                        .lineLimit(3)
                                                    
                                                }.padding(5)
                                                
                                                
                                                
                                            }.frame(height:500)
                                            
                                                //.padding([.trailing],30)
                                                .background(Color.gray.opacity(0.2))
                                            .cornerRadius(9)
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                
                    
                    
                    .navigationBarTitle("لوحة الشرف",displayMode: .inline)
                    //.navigationBarHidden(true)
                    //}//.padding([.trailing],10)
                    //.frame(alignment:.trailing)
                    .sheet(isPresented: self.$isArticleViewPersented)
                    {
        //                ArticleView(articleModel:ArticleModel(getArticleByID: self.articleID) )
                         HonorBoardInfoView(honorBoardID: self.honorBoardID )
                }
                
            }
    }





struct HonorBoardInfoView: View {
     @ObservedObject var HBModel = HonorBoardModel()
       var url = "https://mobdenapi.azurewebsites.net/"
       var honorBoardUrl = "assets/honorBoards/"
       
       init(honorBoardID: Int) {
           
           //self.articleModel = ArticleModel()
        self.HBModel.getHonorBoardBy(id: honorBoardID)
       }
       
       var body: some View {
           
           GeometryReader{ geometry in
           
           ScrollView{
           
           
           VStack{
               
               //ForEach(self.articleModel.articles){ article in
                   
                                       VStack{
                                        HStack{
                                            Spacer()
                                            Text(self.HBModel.honorBoardInfo.arabicDate)
                                            .padding([.trailing],5)
                                            //.flipsForRightToLeftLayoutDirection(true)
                                        }
                                        HStack{
                                            Spacer()
                                            Text(self.HBModel.honorBoardInfo.studentFullName)
                                                //.flipsForRightToLeftLayoutDirection(true)
                                                .font(.headline)
                                                .multilineTextAlignment(.trailing)
                                                .lineLimit(3)
                                                .padding([.trailing],5)
                                                //.alignmentGuide(.trailing){d in d[.trailing]}
                                            
                                        }
                                        
                       
                       
                                       }
                                       
                                      // VStack{
                                           UrlImageView(urlString:(self.url + self.honorBoardUrl + self.HBModel.honorBoardInfo.image),width: 400,height: 300)
                
                
                                       
                VStack{
                    Text(self.HBModel.honorBoardInfo.description)
                        .flipsForRightToLeftLayoutDirection(true)
                        .font(.body)
                        //.padding([.trailing],5)
                        .lineSpacing(5)
                                      //.fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.trailing)
                        //.lineLimit(Int.max)

                }
                                       
                 
                                                  
            //}
               
                               
                               
           }.padding(10)
               .frame(width:geometry.size.width)
                           
                               //.padding([.trailing],30)
                               .background(Color.gray.opacity(0.2))
                          // .cornerRadius(15)
           }.frame(width: geometry.size.width)
        }
       }
}







struct HonorBoardView_Previews: PreviewProvider {
    static var previews: some View {
        HonorBoardView(stageId: -1)
    }
}
