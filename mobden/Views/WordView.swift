//
//  WordView.swift
//  mobden
//
//  Created by administrator on 2/29/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct WordView: View {
    @ObservedObject var wordModel = WordModel() //ArticleModel(getArticleByID:)
    var url = "https://mobdenapi.azurewebsites.net/"
    var wordUrl = "assets/Word/"
    
    init() {
        
        //self.articleModel = ArticleModel()
        self.wordModel.getWord()
    }
    
    var body: some View {
        
        GeometryReader{ geometry in
        
        ScrollView{
        
        
        VStack{
            
            ForEach(self.wordModel.words){ word in
                
                                    VStack{
//                                     HStack{
//                                         Spacer()
//                                         Text(word.arabicDate)
//                                         .padding([.trailing],5)
//                                         //.flipsForRightToLeftLayoutDirection(true)
//                                     }
                                     HStack{
                                         Spacer()
                                         Text(word.title)
                                             //.flipsForRightToLeftLayoutDirection(true)
                                             .font(.headline)
                                             .multilineTextAlignment(.trailing)
                                             .lineLimit(3)
                                             .padding([.trailing],5)
                                             //.alignmentGuide(.trailing){d in d[.trailing]}
                                         
                                     }
                                     
                    
                    
                                    }
                                    
                                   // VStack{
                                        UrlImageView(urlString:(self.url + self.wordUrl + word.image),width: 400,height: 300)
             
             
                                    
             VStack{
                 Text(word.description)
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

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
