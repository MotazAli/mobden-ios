//
//  SupervisionInfoView.swift
//  mobden
//
//  Created by administrator on 3/5/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI
import Combine

struct SupervisionInfoView: View {
    @ObservedObject var SDModel = SupervisionAndDevelopmentModel() //ArticleModel(getArticleByID:)
        //var url = "https://mobdenapi.azurewebsites.net/"
        //var articleUrl = "assets/articles/"
        
        init(id: Int) {
            
            //self.articleModel = ArticleModel()
            self.SDModel.getAboutSupervisionByID(id: id)
        }
        
        var body: some View {
            
            //GeometryReader{ geometry in
            
            ScrollView{
            
            
            VStack{
                
                //ForEach(self.articleModel.articles){ article in
                    
                                        //VStack{
    //                                     HStack{
    //                                         Spacer()
    //                                         Text(article.arabicDate)
    //                                         .padding([.trailing],5)
    //                                         //.flipsForRightToLeftLayoutDirection(true)
    //                                     }
                                         HStack{
                                             Spacer()
                                            Text(self.SDModel.supervisionAndDevelopmentInfo.title)
                                                 //.flipsForRightToLeftLayoutDirection(true)
                                                 .font(.headline)
                                                 .multilineTextAlignment(.trailing)
                                                 .lineLimit(3)
                                                 .padding([.trailing],5)
                                                 //.alignmentGuide(.trailing){d in d[.trailing]}
                                             
                                         }
                                         
                        
                        
                                       // }
                                        
                                       // VStack{
    //                                        UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 400,height: 300)
                 
                 
                                        
                 //VStack{
                    Text(self.SDModel.supervisionAndDevelopmentInfo.description)
                         //.flipsForRightToLeftLayoutDirection(true)
                         .font(.body)
                        //.padding()
                    //.flipsForRightToLeftLayoutDirection(true)
                         .lineSpacing(5)
                                       //.fixedSize(horizontal: false, vertical: true)
                         .multilineTextAlignment(.trailing)
                .padding()
                         //.lineLimit(Int.max)

                //}
                                        
                  
                                                    
                //}
                
                                
                                
            }//.padding(10)
                //.frame(width:geometry.size.width )
                            
                                //.padding([.trailing],30)
                .background(Color.gray.opacity(0.2))
                           // .cornerRadius(15)
            }//.frame(width: geometry.size.width)
            //}
    .navigationBarTitle("توضيح",displayMode: .inline)
        }
}

struct SupervisionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionInfoView(id:0)
    }
}
