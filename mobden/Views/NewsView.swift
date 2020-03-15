//
//  NewsView.swift
//  mobden
//
//  Created by administrator on 3/12/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @State var isSheetPersented = false
        @State var newsID : Int = 0
        @ObservedObject var newsModel = NewsModel()
        var url = "https://mobdenapi.azurewebsites.net/"
        var newsUrl = "assets/images/news/"
        
        
    init(stageID : Int) {
            //self.articleModel = ArticleModel()
            self.newsModel.getNewsByCategoryID(id: stageID)
        }
        
        
        var body: some View {
           // NavigationView{
            List(newsModel.newsList){ news in
                    
                    
                    Button(action: {
                        
                        self.newsID = news.id
                        self.isSheetPersented.toggle()
                        
                    }){
                        
                        

                                        
                                        VStack{
                                            VStack{
                                                HStack{
                                                    Spacer()
                                                    Text(news.arabicDate)
                                                    .padding([.trailing],5)
                                                    //.flipsForRightToLeftLayoutDirection(true)
                                                }
                                                HStack{
                                                    Spacer()
                                                    Text(news.title)
                                                        //.flipsForRightToLeftLayoutDirection(true)
                                                        .font(.headline)
                                                        .multilineTextAlignment(.trailing)
                                                        .lineLimit(3)
                                                        .padding([.trailing],5)
                                                        //.alignmentGuide(.trailing){d in d[.trailing]}
                                                    
                                                }
                                                
                                                
                                            }
                                            
                                            //VStack{
                                                UrlImageView(urlString:(self.url + self.newsUrl + news.image),width: 330,height: 300)                    //}.padding([.trailing],10)


                                            
                                            
                                            
                        //                        Image("company_logo")
                        //                        .resizable()
                        //                        .scaledToFit()
                        //                            .frame( height: 300)
                                            
                                            VStack{
                                                Text(news.description)
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
                
                
            
                
                
                .navigationBarTitle("الاخبار",displayMode: .inline)
                //.navigationBarHidden(true)
                //}//.padding([.trailing],10)
                //.frame(alignment:.trailing)
                .sheet(isPresented: self.$isSheetPersented)
                {
    //                ArticleView(articleModel:ArticleModel(getArticleByID: self.articleID) )
                     NewsDetailsView(newsID: self.newsID )
            }
            
        }
}





struct NewsDetailsView: View {
     @ObservedObject var newsModel = NewsModel() //ArticleModel(getArticleByID:)
       var url = "https://mobdenapi.azurewebsites.net/"
       var newsUrl = "assets/images/news/"
       
       init(newsID: Int) {
           
           //self.articleModel = ArticleModel()
        self.newsModel.getNewsByID(id: newsID)
       }
       
       var body: some View {
           
           GeometryReader{ geometry in
           
           ScrollView{
           
           
           VStack{
               
               //ForEach(self.newsModel.news){ info in
                   
                                       VStack{
                                        HStack{
                                            Spacer()
                                            Text(self.newsModel.news.arabicDate)
                                            .padding([.trailing],5)
                                            //.flipsForRightToLeftLayoutDirection(true)
                                        }
                                        HStack{
                                            Spacer()
                                            Text(self.newsModel.news.title)
                                                //.flipsForRightToLeftLayoutDirection(true)
                                                .font(.headline)
                                                .multilineTextAlignment(.trailing)
                                                .lineLimit(3)
                                                .padding([.trailing],5)
                                                //.alignmentGuide(.trailing){d in d[.trailing]}
                                            
                                        }
                                        
                       
                       
                                       }
                                       
                                      // VStack{
                                           UrlImageView(urlString:(self.url + self.newsUrl + self.newsModel.news.image),width: 400,height: 300)
                
                
                                       
                VStack{
                    Text(self.newsModel.news.description)
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
            
            
            
            VStack{
                List(self.newsModel.news.newsImages){ img in
                    
                    UrlImageView(urlString:(self.url + self.newsUrl + img.image),width: 350,height: 200).padding(8)
                    
                    
                }
            }.frame(height:geometry.size.height / 2)
            
            
            
                          // .cornerRadius(15)
           }.frame(width: geometry.size.width)
        }
       }
}
























struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(stageID: 0)
    }
}
