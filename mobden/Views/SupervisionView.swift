//
//  SupervisionView.swift
//  mobden
//
//  Created by administrator on 3/3/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI



struct Opacity: ViewModifier {
    private let opacity: Double
    init(_ opacity: Double) {
        self.opacity = opacity
    }

    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}

extension AnyTransition {
    static func repeating<T: ViewModifier>(from: T, to: T, duration: Double = 1) -> AnyTransition {
       .asymmetric(
            insertion: AnyTransition
                .modifier(active: from, identity: to)
                .animation(Animation.easeInOut(duration: duration).repeatForever())
                .combined(with: .opacity),
            removal: .opacity
        )
    }
}


struct SupervisionView: View {
    
     //@ObservedObject var supervisionAndDevelopmentModel = SupervisionAndDevelopmentModel()
    @State var spin = false
    @State var imageTransation = false
    @State var shaked = false
    
     //var url = "https://mobdenapi.azurewebsites.net/"
     //var prizesUrl = "assets/prizes/"
     
//     init(){
//        self.supervisionAndDevelopmentModel.getAboutSupervisions()
//     }
     
     
     var body: some View{
         
        NavigationView{
         GeometryReader{ geometry in
             VStack{
                 // NavigationView{
                    
                    VStack(alignment:.center){
                        
                        
                        
                        
                        if self.imageTransation {
                        Image(systemName:"text.bubble.fill")// : "bubble.left.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                            .frame(width:100 , height: 80)
                            //.transition(AnyTransition.opacity.animation( Animation.easeInOut(duration: 0.8)))
                            .transition(.repeating(from: Opacity(0), to: Opacity(1)))
                            
                            //.animation(self.foreverAnimation)
                                                        
                        
                        }
                        
                        
                            Text("الاشراف والتطوير المهنى").font(.title).fontWeight(.medium)
                      
                        
                        
                        
                        
                        
                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.gray)
                .onAppear(){

                    //if self.imageTransation {
                        self.imageTransation.toggle()
//                        DispatchQueue.main.async {
//                            self.imageTransation.toggle()
//                        }
//                    }
                       // self.imageTransation.toggle()



                }
                
                
                
                
                    VStack(alignment:.center){
                        Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                                .frame(width:100 , height:80)
                            .rotationEffect(.degrees(self.spin ? 360: 0))
                            .animation(Animation.linear(duration:1 ).repeatForever(autoreverses:false))
                            .onAppear(){
                                self.spin = true
                        }
                        Text("فريق العمل بقسم الاشراف والتطوير المهني").font(.title)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center).lineLimit(2)
                        
                        
                        
                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.orange)
                    
                    VStack(alignment:.center){

                        VStack{
                            
                            Image(systemName: "pencil.and.ellipsis.rectangle")
                            .resizable()
                            .scaledToFit()
                                    .frame(width:100 , height: 80)
                                .offset(x: self.shaked ? -10 : 15)
                                .animation(Animation.easeInOut.repeatForever().speed(2))
                            Text("خطط الاشراف الجديدة").font(.title).fontWeight(.medium)
                        }
                        



                    }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                    .background(Color.green)
                        .onAppear(){
                            self.shaked = true
                }
                    
                    
                  
                 // }.frame(width: geometry.size.width,height: geometry.size.height)
                 
                 
                 
               }.frame(width: geometry.size.width,height: geometry.size.height)
         
         
         
         }//.padding(.top,10)
         
         
        }
           }
     
    
}

struct SupervisionView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionView()
    }
}
