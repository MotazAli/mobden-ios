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
        @State var isSheetPersented = false
    //@State var isWordViewPersented = false
        @State var articleID :Int = 0
    @State var viewName : ViewScreen = ViewScreen.noView
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
                ScrollView{
                //Group{

                    
                    
                    if !model.words.isEmpty{
                        VStack{
                            
                            ForEach(model.words){ word in
                                VStack{
                                    
                                    Button(action: {
                                        
                                        self.viewName = ViewScreen.wordView
                                        self.isSheetPersented.toggle()
                                        
                                        
                                    }){
                                        VStack{
                                            HStack{
                                                 Spacer()
                                                Text(word.title).foregroundColor(.primary)
                                             }
                                            
                                             VStack{
                                                 UrlImageView(urlString:(self.url + self.wordUrl + word.image),width: 350,height: 200)
                                             }.padding(.leading,10)
                                        }
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                            }
                            Spacer()
                        }.padding(.bottom,20)
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
                    
                    
                    VStack{
                        NavigationLink(destination: ArticlesView()){
                            HStack{
                                Text("شاهد الكل").foregroundColor(Color.blue)
                                Spacer()
                                Text("المقالات").foregroundColor(.primary)
                                    .frame(width:100 , height:25,alignment: .center)
                                    .background(Color.gray.opacity(0.8))

                                .cornerRadius(7)
                                .shadow(radius: 4)
                                
                                
                            }
                            
                            
                        }
                        
                        
                        if articleModel.articles.isEmpty{
                            VStack(alignment:.center){
                                Text("فارغ").frame(width:200,height:200)
                                    .background(Color.red.opacity(0.3))
                                .cornerRadius(9)
                            }.frame(height: 250)
                        }
                        else{
                        
                        
                        
                        
                        
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack(spacing:20){
                                    
                                    ForEach(articleModel.articles){ article in
                                        
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
                                            .background(Color.red.opacity(0.3))
                                                
                                            .clipShape(Rectangle())
                                            .cornerRadius(15)
                                                .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                            
                                            
                                        }.frame(width:300 , height: 200)
                                        .padding(.top,80)
                                        
                                    }
                                    
                                    
                                    
                                }.padding(30)
                                
                                Spacer()
                                
                        
//                                VStack(alignment:.leading){
//
//                            HStack{
//                               ForEach(articleModel.articles){ article in
//
//                                VStack{
//
//                                    Button(action: {
//                                        self.viewName = ViewScreen.articaleView
//                                        self.articleID = article.id
//                                        self.isSheetPersented.toggle()
//
//                                    }){
//                                        VStack(alignment: .center){
//
//                                            UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 300,height: 200)
//                                            Text(article.title).foregroundColor(.primary)
//                                            }
//
//
//                                    }
//                                }.frame(height: 400).padding(10)
//                                    .cornerRadius(20)
//                                .background(Color.red.opacity(0.15))
//
//
//
//
//                               }
//
//
//                            }
//
//                                }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                        
                    }.frame(height:430)
                        }
                    }
                    
                    
                    
                    
                    
                //}
                
                
               // Group{


                    VStack{
                        NavigationLink(destination: ArticlesView()){
                            HStack{
                                Text("شاهد الكل").foregroundColor(Color.blue)
                                Spacer()
                                Text("عن المدرسة").foregroundColor(.primary)
                                .frame(width:100 , height:25,alignment: .center)
                                    .background(Color.gray.opacity(0.8))

                                .cornerRadius(7)
                                .shadow(radius: 4)
                            }
                            
                            
                        }
                        
                        
                        
                        if aboutSchoolModel.aboutSchoolList.isEmpty{
                            VStack(alignment:.center){
                                Text("فارغ").frame(width:200,height:200)
                                    .background(Color.red.opacity(0.3))
                                .cornerRadius(9)
                            }.frame(height: 250)
                        }
                        else{
                        
                        
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                
                                
                                HStack(spacing:20){
                                    
                                    ForEach(aboutSchoolModel.aboutSchoolList){ about in
                                        
                                        GeometryReader{ geometry in
                                            
                                            
                                            VStack{
                                                Button(action: {
                                                           
                                                            
                                                        }){
                                                            VStack(alignment: .center){
                                                                
                                                                UrlImageView(urlString:(self.url + self.aboutSchoolUrl + about.image),width: 270,height: 200)
                                                                    .clipShape(Rectangle())
                                                                    .cornerRadius(8)
                                                                    .padding(.horizontal , 10)
                                                                
                                                                
                                                                Text(about.tile).foregroundColor(.primary)
                                                                .padding(.horizontal , 10)
                                                                }
                                                                
                                                            
                                                }
                                            }.frame(width:300,height:380)
                                            .background(Color.gray.opacity(0.3))
                                                
                                            .clipShape(Rectangle())
                                            .cornerRadius(15)
                                                .rotation3DEffect(Angle(degrees:(Double(geometry.frame(in: .global).minX) - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                            
                                            
                                        }.frame(width:300 , height: 200)
                                        .padding(.top,80)
                                        
                                    }
                                    
                                    
                                    
                                }.padding(30)
                                
                                Spacer()
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
//
//
//                                VStack(alignment:.leading){
//
//                            HStack{
//                               ForEach(aboutSchoolModel.aboutSchoolList){ about in
//
//
//                                VStack{
//
//                                    Button(action: {
//
//                                    }){
//                                        VStack(alignment: .center){
//
//                                            UrlImageView(urlString:(self.url + self.aboutSchoolUrl + about.image),width: 300,height: 200)
//                                             Text(about.tile).foregroundColor(.primary)
//                                        }
//                                    }
//
//                                }.frame(height: 400).padding(10)
//                                    .cornerRadius(20)
//                                .background(Color.red.opacity(0.15))
//
//
//
//                               }
//
//
//                            }
//
//                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                                
                            }.frame(height:450)
                        }

                        }




                    
                    
                    VStack{
                        //NavigationLink(destination: ArticlesView()){
                            HStack{
                                Spacer()
                                Text("لوحة الشرف")
                                .frame(width:100 , height:25,alignment: .center)
                                    .background(Color.gray.opacity(0.8))

                                .cornerRadius(7)
                                .shadow(radius: 4)
                            }
                            
                            
                        //}
                        
                        
                        if honorBoardModel.honorBoardList.isEmpty{
                            VStack(alignment:.center){
                                Text("فارغ").frame(width:200,height:200)
                                    .background(Color.red.opacity(0.3))
                                .cornerRadius(9)
                            }.frame(height: 250)
                        }
                        else {
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                
                                HStack(spacing:20){
                                    
                                    ForEach(honorBoardModel.honorBoardList){ honor in
                                        
                                        GeometryReader{ geometry in
                                            
                                            
                                            VStack{
                                                Button(action: {
                                                            
                                                            
                                                        }){
                                                            VStack(alignment: .center){
                                                                
                                                                UrlImageView(urlString:(self.url + self.honorBoardUrl + honor.image),width: 270,height: 200)
                                                                    .clipShape(Rectangle())
                                                                    .cornerRadius(8)
                                                                    .padding(.horizontal , 10)
                                                                
                                                                
//                                                                Text(honor.description).foregroundColor(.primary)
//                                                                .padding(.horizontal , 10)
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
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
//                                        VStack(alignment:.leading){
//
//                                    HStack{
//                                       ForEach(honorBoardModel.honorBoardList){ honor in
//
//                                        VStack{
//
//                                            Button(action: {
//
//
//
//                                            }){
//                                                VStack(alignment: .center){
//
//                                                    UrlImageView(urlString:(self.url + self.honorBoardUrl + honor.image),width: 300,height: 200)
//                                                    Text(honor.description).foregroundColor(.primary)
//                                                    }
//
//
//                                            }
//                                        }.frame(height: 400).padding(10)
//                                            .cornerRadius(20)
//                                        .background(Color.blue.opacity(0.15))
//
//
//
//
//                                       }
//
//
//                                    }
//
//                                        }.frame(minWidth: 0, idealWidth: nil, maxWidth: .infinity, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                                
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
        else{
            return AnyView( EmptyView())
        }
        
    }
    
    
    

}





struct HomeMasterView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMasterView()
    }
}
