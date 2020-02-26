//
//  HomeMasterView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct HomeMasterView: View {
     @State var authenticated: Bool = false
        @State var isArticleViewPersented = false
        @State var articleID :Int = 0
         @ObservedObject var model = WordModel()
        @ObservedObject var articleModel = ArticleModel()
        @ObservedObject var aboutSchoolModel = AboutSchoolModel()
         var url = "https://mobdenapi.azurewebsites.net/"
         var wordUrl = "assets/Word/"
           var articleUrl = "assets/articles/"
        var aboutSchoolUrl = "assets/about/"
        
        
        init() {
            self.model.getWord()
            //self.articleModel = ArticleModel()
            self.articleModel.getTopThreeArticles()
            self.aboutSchoolModel.getAboutSchool()
            
        }
        
           
           var body: some View {
               
            NavigationView{
                //Text("text")
                List{
                //Group{

                    
                    
                    
                    
                    VStack(alignment:.trailing){
                        ForEach(model.words){ word in
                            UrlImageView(urlString:(self.url + self.wordUrl + word.image),width: 300,height: 200)
                            Text(word.title)
                        }
                        Spacer()
                    }
                    
                    
//
//                    VStack(alignment:.trailing){
//                                Text("لوحة الشرف")
//                            ScrollView(.horizontal,showsIndicators: false){
//
//                                VStack(alignment:.leading){
//
//                            HStack{
//                               ForEach(model.words){ word in
//
//
//
//
//                                VStack(alignment: .center){
//
//                                       UrlImageView(urlString:(self.url + self.wordUrl + word.image),width: 300,height: 200)
//                                        Text(word.title)
//                                   }.frame(width: 300, height: 400, alignment: .center)
//                               }
//
//
//                            }
//
//                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
//                            }.frame(height:300)
//
//                        }







                //}
                //Group{
                    
                    
                    VStack(alignment:.trailing){
                        NavigationLink(destination: ArticlesView()){
                            Text("المقالات")
                            
                        }
                        
                            ScrollView(.horizontal,showsIndicators: false){
                        
                                VStack(alignment:.leading){
                            
                            HStack{
                               ForEach(articleModel.articles){ article in
                                
                                Button(action: {
                                    
                                    self.articleID = article.id
                                    self.isArticleViewPersented.toggle()
                                    
                                }){
                                    VStack(alignment: .center){
                                        
                                        UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 300,height: 200)
                                        Text(article.title).foregroundColor(.primary)
                                        }.frame(width: 300, height: 400, alignment: .center)
                                    
                                }
                                
                               }
                                   
                                    
                            }
                            
                                }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                        
                    }.frame(height:300)
                    
                        }
                    
                    
                    
                    
                    
                //}
                
                
               // Group{


                    VStack(alignment:.trailing){
                                Text("عن المدرسة")
                            ScrollView(.horizontal,showsIndicators: false){

                                VStack(alignment:.leading){

                            HStack{
                               ForEach(aboutSchoolModel.aboutSchoolList){ about in
                                VStack(alignment: .center){

                                       UrlImageView(urlString:(self.url + self.aboutSchoolUrl + about.image),width: 300,height: 200)
                                        Text(about.tile)
                                   }.frame(width: 300, height: 400, alignment: .center)
                               }


                            }

                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                            }.frame(width:UIScreen.main.bounds.width,height:300)

                        }








                //}
                
                
                
            }
            
            
            }.sheet(isPresented:self.$isArticleViewPersented){
    //            ArticleView(articleModel : ArticleModel(getArticleByID: self.articleID))
                
                ArticleView(articleID: self.articleID)
                
            }
               
           }

}

struct HomeMasterView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMasterView()
    }
}
