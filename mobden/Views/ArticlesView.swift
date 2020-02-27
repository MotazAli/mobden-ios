//
//  ArticlesView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct ArticlesView: View {
    @State var isArticleViewPersented = false
        @State var articleID : Int = 0
        @ObservedObject var articleModel = ArticleModel()
        var url = "https://mobdenapi.azurewebsites.net/"
        var articleUrl = "assets/articles/"
        
        
        init() {
            //self.articleModel = ArticleModel()
            self.articleModel.getTopThreeArticles()
        }
        
        
        var body: some View {
            NavigationView{
                List(articleModel.articles){ article in
                    
                    
                    Button(action: {
                        
                        self.articleID = article.id
                        self.isArticleViewPersented.toggle()
                        
                    }){
                        
                        

                                        
                                        VStack{
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
                                            
                                            //VStack{
                                                UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 330,height: 300)                    //}.padding([.trailing],10)


                                            
                                            
                                            
                        //                        Image("company_logo")
                        //                        .resizable()
                        //                        .scaledToFit()
                        //                            .frame( height: 300)
                                            
                                            VStack{
                                                Text(article.description)
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
                //.navigationBarTitle("مقالات")
                
                }//.padding([.trailing],10)
                //.frame(alignment:.trailing)
                .sheet(isPresented: self.$isArticleViewPersented)
                {
    //                ArticleView(articleModel:ArticleModel(getArticleByID: self.articleID) )
                     ArticleView(articleID: self.articleID )
            }
            
        }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView()
    }
}
