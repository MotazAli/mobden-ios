//
//  MiddleSchoolHomeView.swift
//  mobden
//
//  Created by administrator on 3/13/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct MiddleSchoolHomeView: View {
     @State var authenticated: Bool = false
               @State var isSheetPersented = false
               @State var articleID :Int = 0
       @State var newsID : Int = 0
           @State var viewName : ViewScreen = ViewScreen.noView
                
               @ObservedObject var articleModel = ArticleModel()
               @ObservedObject var newsModel = NewsModel()
           @ObservedObject var honorBoardModel = HonorBoardlModel()
                var url = "https://mobdenapi.azurewebsites.net/"
                  var articleUrl = "assets/articles/"
           var honorBoardUrl = "assets/honorBoards/"
       var newsUrl = "assets/images/news/"
               
               
               init() {
                   
                   self.articleModel.getTopThreeArticleByStage(id: 2)
                   self.newsModel.getThreeNewsByStage(id: 2)
                self.honorBoardModel.getHonorBoardByStage(id: 2)
                   
               }
               
                  
                  var body: some View {
                      
                   NavigationView{
                       //Text("text")
                       ScrollView{
                       //Group{

                           
                           
                           
                           VStack{
                               NavigationLink(destination: ArticlesView()){
                                   HStack{
                                       Text("شاهد الكل").foregroundColor(Color.blue)
                                       Spacer()
                                       Text("المقالات").foregroundColor(.primary)
                                           .frame(width:100 , height:25,alignment: .center)
                                           .background(Color.green.opacity(0.6))

                                       .cornerRadius(5)
                                       .shadow(radius: 4)
                                       
                                       
                                   }
                                   
                                   
                               }
                               
                               
                               if articleModel.PrimaryArticles.isEmpty{
                                   VStack(alignment:.center){
                                       Text("فارغ").frame(width:200,height:200)
                                           .background(Color.blue.opacity(0.3))
                                       .cornerRadius(9)
                                   }.frame(height: 250)
                               }
                               else{
                               
                               
                               ScrollView(.horizontal,showsIndicators: false){
                                                               
                                                               HStack(spacing:20){
                                                                   
                                                                   ForEach(articleModel.PrimaryArticles){ article in
                                                                       
                                                                       GeometryReader{ geometry in
                                                                           
                                                                           
                                                                           VStack{
                                                                               Button(action: {
                                                                                            self.viewName = ViewScreen.articaleView
                                                                                           self.articleID = article.id
                                                                                           self.isSheetPersented.toggle()
                                                                                           
                                                                                       }){
                                                                                           VStack(alignment: .center){
                                                                                               
                                                                                               UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 270,height: 200)
                                                                                                   .clipShape(Rectangle())
                                                                                                   .cornerRadius(8)
                                                                                                   .padding(.horizontal , 10)
                                                                                               
                                                                                               
                                                                                               Text(article.title).foregroundColor(.primary)
                                                                                               .padding(.horizontal , 10)
                                                                                               }
                                                                                               
                                                                                           
                                                                               }
                                                                           }.frame(width:300,height:380)
                                                                           .background(Color.blue.opacity(0.3))
                                                                               
                                                                           .clipShape(Rectangle())
                                                                           .cornerRadius(15)
                                                                               .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                                                           
                                                                           
                                                                       }.frame(width:300 , height: 200)
                                                                       .padding(.top,80)
                                                                       
                                                                   }
                                                                   
                                                                   
                                                                   
                                                               }.padding(30)
                                                               
                                                               Spacer()
                                                               
                                                       
                                                   }.frame(height:430)
                               
                               
                                 
                               }
                           }
                           
                           
                           
                           
                           
                       //}
                       
                       
                      // Group{


                           VStack{
                               NavigationLink(destination: NewsView(stageID: 2)){
                                   HStack{
                                       Text("شاهد الكل").foregroundColor(Color.blue)
                                       Spacer()
                                       Text("الاخبار").foregroundColor(.primary)
                                       .frame(width:100 , height:25,alignment: .center)
                                           .background(Color.green.opacity(0.6))

                                       .cornerRadius(5)
                                       .shadow(radius: 4)
                                   }
                                   
                                   
                               }
                               
                               
                               
                               if newsModel.topThreeNews.isEmpty{
                                   VStack(alignment:.center){
                                       Text("فارغ").frame(width:200,height:200)
                                           .background(Color.blue.opacity(0.3))
                                       .cornerRadius(9)
                                   }.frame(height: 250)
                               }
                               else{
                               
                               ScrollView(.horizontal,showsIndicators: false){
                                                               
                                                               HStack(spacing:20){
                                                                   
                                                                   ForEach(newsModel.topThreeNews){ news in
                                                                       
                                                                       GeometryReader{ geometry in
                                                                           
                                                                           
                                                                           VStack{
                                                                               Button(action: {
                                                                                            self.viewName = ViewScreen.newsView
                                                                                           self.newsID = news.id
                                                                                           self.isSheetPersented.toggle()
                                                                                           
                                                                                       }){
                                                                                           VStack(alignment: .center){
                                                                                               
                                                                                               UrlImageView(urlString:(self.url + self.newsUrl + news.image),width: 270,height: 200)
                                                                                                   .clipShape(Rectangle())
                                                                                                   .cornerRadius(8)
                                                                                                   .padding(.horizontal , 10)
                                                                                               
                                                                                               
                                                                                               Text(news.title).foregroundColor(.primary)
                                                                                               .padding(.horizontal , 10)
                                                                                               }
                                                                                               
                                                                                           
                                                                               }
                                                                           }.frame(width:300,height:380)
                                                                           .background(Color.blue.opacity(0.3))
                                                                               
                                                                           .clipShape(Rectangle())
                                                                           .cornerRadius(15)
                                                                               .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                                                           
                                                                           
                                                                       }.frame(width:300 , height: 200)
                                                                       .padding(.top,80)
                                                                       
                                                                   }
                                                                   
                                                                   
                                                                   
                                                               }.padding(30)
                                                               
                                                               Spacer()
                                                               
                                                       
                                                   }.frame(height:430)
                               
                                  
                               }

                               }




                           
                           
                           VStack{
                               //NavigationLink(destination: ArticlesView()){
                                   HStack{
                                       Spacer()
                                       Text("لوحة الشرف")
                                       .frame(width:100 , height:25,alignment: .center)
                                           .background(Color.green.opacity(0.6))

                                       .cornerRadius(5)
                                       .shadow(radius: 4)
                                   }
                                   
                                   
                               //}
                               
                               
                            if honorBoardModel.honorBoardStageList.isEmpty{
                                   VStack(alignment:.center){
                                       Text("فارغ").frame(width:200,height:200)
                                           .background(Color.blue.opacity(0.3))
                                       .cornerRadius(9)
                                   }.frame(height: 250)
                               }
                               else {
                                   
                                   ScrollView(.horizontal,showsIndicators: false){
                                       
                                       
                                       HStack(spacing:20){
                                           
                                           ForEach(honorBoardModel.honorBoardStageList){ honor in
                                               
                                               GeometryReader{ geometry in
                                                   
                                                   
                                                   VStack{
                                                       Button(action: {
                                                                   
                                                                   
                                                               }){
                                                                   VStack(alignment: .center){
                                                                       
                                                                       UrlImageView(urlString:(self.url + self.honorBoardUrl + honor.image),width: 270,height: 200)
                                                                           .clipShape(Rectangle())
                                                                           .cornerRadius(8)
                                                                           .padding(.horizontal , 10)
                                                                       
    
                                                                       }
                                                                       
                                                                   
                                                       }
                                                   }.frame(width:300,height:380)
                                                   .background(Color.red.opacity(0.3))
                                                       
                                                   .clipShape(Rectangle())
                                                   .cornerRadius(15)
                                                       .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                                   
                                                   
                                               }.frame(width:300 , height: 200)
                                               .padding(.top,80)
                                               
                                           }
                                           
                                           
                                           
                                       }.padding(30)
                                       
                                       Spacer()
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                   }.frame(height:430)
                                   
                               }
                               
                               
                               
                               
                                   
                           
                               }
                           
                           
                           
                           



                       //}
                       
                       
                       
                   }
                   
                       
                       
                       .navigationBarTitle("الرئيسية")
                       .navigationBarHidden(true)
                       
                       
                   
                   }.sheet(isPresented:self.$isSheetPersented){
           //            ArticleView(articleModel : ArticleModel(getArticleByID: self.articleID))
                      
                       self.getViewByID(viewScreen: self.viewName)
                       
                       
                   }
                      
                  }
           
           
           
           
           func getViewByID(viewScreen: ViewScreen) -> AnyView {
               if viewScreen == ViewScreen.wordView{
                   return AnyView( WordView())
                   
               }
               else if viewScreen == ViewScreen.articaleView {
                   return AnyView( ArticleView(articleID: self.articleID))
                              
               }
               else if viewScreen == ViewScreen.prizesView {
                   return AnyView( PrizesView())
                              
               }
               else if viewScreen == ViewScreen.newsView {
                   return AnyView( NewsDetailsView(newsID: self.newsID))
                              
               }
               else{
                   return AnyView( EmptyView())
               }
               
           }
           
        
}

struct MiddleSchoolHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleSchoolHomeView()
    }
}
