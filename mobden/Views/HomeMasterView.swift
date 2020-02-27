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
    @ObservedObject var honorBoardModel = HonorBoardlModel()
         var url = "https://mobdenapi.azurewebsites.net/"
         var wordUrl = "assets/Word/"
           var articleUrl = "assets/articles/"
        var aboutSchoolUrl = "assets/about/"
    var honorBoardUrl = "assets/honorBoards/"
        
        
        init() {
            self.model.getWord()
            //self.articleModel = ArticleModel()
            self.articleModel.getTopThreeArticles()
            self.aboutSchoolModel.getAboutSchool()
            self.honorBoardModel.getAllHonorBoard()
            
        }
        
           
           var body: some View {
               
            NavigationView{
                //Text("text")
                List{
                //Group{

                    
                    
                    
                    
                    VStack{
                        ForEach(model.words){ word in
                            VStack{
                                HStack{
                                    Spacer()
                                     Text(word.title)
                                }
                               
                                VStack{
                                    UrlImageView(urlString:(self.url + self.wordUrl + word.image),width: 350,height: 200)
                                }.padding(.leading,10)
                                
                            }
                            
                            
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
                            HStack{
                                Spacer()
                                Text("المقالات")
                            }
                            
                            
                        }
                        
                            ScrollView(.horizontal,showsIndicators: false){
                        
                                VStack(alignment:.leading){
                            
                            HStack{
                               ForEach(articleModel.articles){ article in
                                
                                VStack{

                                    Button(action: {
                                        
                                        self.articleID = article.id
                                        self.isArticleViewPersented.toggle()
                                        
                                    }){
                                        VStack(alignment: .center){
                                            
                                            UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 300,height: 200)
                                            Text(article.title).foregroundColor(.primary)
                                            }
                                            
                                        
                                    }
                                }.frame(height: 400).padding(10)
                                    .cornerRadius(20)
                                .background(Color.blue.opacity(0.15))
                                
                                
                                
                                
                               }
                                   
                                    
                            }
                            
                                }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                        
                    }.frame(height:300)
                    
                        }
                    
                    
                    
                    
                    
                //}
                
                
               // Group{


                    VStack{
                        NavigationLink(destination: ArticlesView()){
                            HStack{
                                Spacer()
                                Text("عن المدرسة")
                            }.padding([.trailing], 55)
                            
                            
                        }
                        
                            
                            ScrollView(.horizontal,showsIndicators: false){

                                VStack(alignment:.leading){

                            HStack{
                               ForEach(aboutSchoolModel.aboutSchoolList){ about in
                                
                                
                                VStack{
                                    
                                    Button(action: {
                                        
                                    }){
                                        VStack(alignment: .center){

                                            UrlImageView(urlString:(self.url + self.aboutSchoolUrl + about.image),width: 300,height: 200)
                                             Text(about.tile).foregroundColor(.primary)
                                        }
                                    }
                                    
                                }.frame(height: 400).padding(10)
                                    .cornerRadius(20)
                                .background(Color.blue.opacity(0.15))
                                
                                
                                
                               }


                            }

                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                            }.frame(width:UIScreen.main.bounds.width,height:300)

                        }




                    
                    
                    VStack{
                        //NavigationLink(destination: ArticlesView()){
                            HStack{
                                Spacer()
                                Text("لوحة الشرف")
                            }
                            
                            
                        //}
                        
                        
                        if honorBoardModel.honorBoardList.isEmpty{
                            VStack(alignment:.center){
                                Text("فارغ").frame(width:200,height:50)
                                    .background(Color.red.opacity(0.5))
                                .cornerRadius(9)
                            }
                        }
                        else {
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                        VStack(alignment:.leading){
                                    
                                    HStack{
                                       ForEach(honorBoardModel.honorBoardList){ honor in
                                        
                                        VStack{

                                            Button(action: {
                                                
                                                self.articleID = honor.id
                                                self.isArticleViewPersented.toggle()
                                                
                                            }){
                                                VStack(alignment: .center){
                                                    
                                                    UrlImageView(urlString:(self.url + self.honorBoardUrl + honor.image),width: 300,height: 200)
                                                    Text(honor.description).foregroundColor(.primary)
                                                    }
                                                    
                                                
                                            }
                                        }.frame(height: 400).padding(10)
                                            .cornerRadius(20)
                                        .background(Color.blue.opacity(0.15))
                                        
                                        
                                        
                                        
                                       }
                                           
                                            
                                    }
                                    
                                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                                
                            }.frame(height:300)
                            
                        }
                        
                        
                        
                        
                            
                    
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
