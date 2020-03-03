//
//  PublicRelationInfoView.swift
//  mobden
//
//  Created by administrator on 3/1/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct PublicRelationInfoView: View {
    @ObservedObject var publicRelationModel = PublicRelationModel() //ArticleModel(getArticleByID:)
    //var url = "https://mobdenapi.azurewebsites.net/"
    //var articleUrl = "assets/articles/"
    
    init(publicRelationID: Int) {
        
        //self.articleModel = ArticleModel()
        self.publicRelationModel.getPublicRelationByID(id: publicRelationID)
    }
    
    var body: some View {
        
        GeometryReader{ geometry in
        
        ScrollView{
        
        
        VStack{
            
            //ForEach(self.articleModel.articles){ article in
                
                                    VStack{
//                                     HStack{
//                                         Spacer()
//                                         Text(article.arabicDate)
//                                         .padding([.trailing],5)
//                                         //.flipsForRightToLeftLayoutDirection(true)
//                                     }
                                     HStack{
                                         Spacer()
                                        Text(self.publicRelationModel.publicRelationInfo.title)
                                             //.flipsForRightToLeftLayoutDirection(true)
                                             .font(.headline)
                                             .multilineTextAlignment(.trailing)
                                             .lineLimit(3)
                                             .padding([.trailing],5)
                                             //.alignmentGuide(.trailing){d in d[.trailing]}
                                         
                                     }
                                     
                    
                    
                                    }
                                    
                                   // VStack{
//                                        UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 400,height: 300)
             
             
                                    
             //VStack{
                Text(self.publicRelationModel.publicRelationInfo.description)
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
            .frame(width:geometry.size.width )
                        
                            //.padding([.trailing],30)
            .background(Color.gray.opacity(0.2))
                       // .cornerRadius(15)
        }.frame(width: geometry.size.width)
        }.navigationBarTitle("توضيح",displayMode: .inline)
    }
}

struct PublicRelationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PublicRelationInfoView(publicRelationID:  0)
    }
}
