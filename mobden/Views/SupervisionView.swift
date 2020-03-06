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
         
        
         GeometryReader{ geometry in
            NavigationView{
             VStack{
                 // NavigationView{
                    
                
                
                
                NavigationLink(destination: SupervisionListView()){
                    VStack(alignment:.center){
                                           if self.imageTransation {
                                           Image(systemName:"text.bubble.fill")// : "bubble.left.fill")
                                                                       .resizable()
                                                                       .scaledToFit()
                                                                               .frame(width:100 , height: 80)
                                               .transition(.repeating(from: Opacity(0), to: Opacity(1)))
                                                                           
                                           
                                           }
                                           Text("الاشراف والتطوير المهنى").font(.title).fontWeight(.medium)
                                            
                                       }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                                       .background(Color.gray)
                                   .onAppear(){self.imageTransation.toggle() }
                                   
                }.buttonStyle(PlainButtonStyle())
                
                   
                
                
                NavigationLink(destination: SupervisionTeamView()){
                    VStack(alignment:.center){
                                           VStack{
                                               Image(systemName: "gear")
                                               .resizable()
                                               .scaledToFit()
                                                       .frame(width:100 , height:80)
                                                   .rotationEffect(.degrees(self.spin ? 360: 0))
                                               //.offset(x: 20, y: 200)
                                                   //.animation(Animation.spring().repeatForever(autoreverses:false))
                                                   .onAppear(){
                                                       withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                                                           self.spin = true
                                                       }
                                                       
                                                       
                                               }
                                           }
                                           
                                           Text("فريق العمل بقسم الاشراف والتطوير المهني").font(.title)
                                               .fontWeight(.medium)
                                               .multilineTextAlignment(.center).lineLimit(2)
                                           
                                           
                                           
                                       }.frame(width:geometry.size.width,height: geometry.size.height / 3)
                                       .background(Color.orange)
                }.buttonStyle(PlainButtonStyle())
                
                
                   
                    
                    VStack(alignment:.center){

                        VStack{
                            
                            Image(systemName: "pencil.and.ellipsis.rectangle")
                            .resizable()
                            .scaledToFit()
                                    .frame(width:100 , height: 80)
                                .offset(x: self.shaked ? -5 : 0)
                                .animation(Animation.easeInOut.repeatForever().speed(1))
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
         
            .navigationBarTitle("رجوع")
            .navigationBarHidden(true)
        }
           }
     
    
}

struct SupervisionView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionView()
    }
}
