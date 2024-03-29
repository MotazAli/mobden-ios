//
//  ArticleView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
     @ObservedObject var articleModel = ArticleModel() //ArticleModel(getArticleByID:)
       var url = "https://mobdenapi.azurewebsites.net/"
       var articleUrl = "assets/articles/"
       
       init(articleID: Int) {
           
           //self.articleModel = ArticleModel()
           self.articleModel.getArticleByID(id: articleID)
       }
       
       var body: some View {
           
           GeometryReader{ geometry in
           
           ScrollView{
           
           
           VStack{
               
               ForEach(self.articleModel.articles){ article in
                   
                                       VStack{
                                        HStack{
                                            Spacer()
                                            Text(article.arabicDate)
                                            .padding([.trailing],5)
                                            //.flipsForRightToLeftLayoutDirection(true)
                                        }
                                        HStack{
                                            Spacer()
                                            Text(article.title)
                                                //.flipsForRightToLeftLayoutDirection(true)
                                                .font(.headline)
                                                .multilineTextAlignment(.trailing)
                                                .lineLimit(3)
                                                .padding([.trailing],5)
                                                //.alignmentGuide(.trailing){d in d[.trailing]}
                                            
                                        }
                                        
                       
                       
                                       }
                                       
                                      // VStack{
                                           UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 400,height: 300)
                
                
                                       
                VStack{
                    Text(article.description)
                        .flipsForRightToLeftLayoutDirection(true)
                        .font(.body)
                        //.padding([.trailing],5)
                        .lineSpacing(5)
                                      //.fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.trailing)
                        //.lineLimit(Int.max)

                }
                                       
                 
                                                   }
               
                               
                               
           }.padding(10)
               .frame(width:geometry.size.width)
                           
                               //.padding([.trailing],30)
                               .background(Color.gray.opacity(0.2))
                          // .cornerRadius(15)
           }.frame(width: geometry.size.width)
        }
       }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(articleID:0)
    }
}
