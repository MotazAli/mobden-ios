//
//  UrlImageView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    var height :CGFloat
    var width : CGFloat
    
    
    init(urlString: String? ,width: CGFloat ,height : CGFloat ){
        urlImageModel = UrlImageModel(urlString: urlString)
        self.width = width
        self.height = height
    }
    
    
    var body: some View {
        
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .renderingMode(.original)
        .resizable()
            .frame(width: self.width, height: self.height, alignment: .center)
        .scaledToFit()
                                       //.resizable()
                                       //.frame(width: 300, height: 200, alignment: .center)
                                       //.scaledToFit()
        //.resizable()
            //.aspectRatio(contentMode: .fit)
        //.scaledToFit()
            //.frame( height: self.height)
    }
    
    
    static var defaultImage = UIImage(named: "company_logo")
    
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil,width :100,height:100)
    }
}
