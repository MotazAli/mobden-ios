//
//  TransferView.swift
//  mobden
//
//  Created by administrator on 3/9/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct TransferView: View {
    @State var spin = false
            @State var imageTransation = false
            @State var shaked = false
            @State var selectedTab : Int = 1
             //var url = "https://mobdenapi.azurewebsites.net/"
             //var prizesUrl = "assets/prizes/"
             
        //     init(){
        //        self.supervisionAndDevelopmentModel.getAboutSupervisions()
        //     }
             
             
             var body: some View{
                 
                
                 GeometryReader{ geometry in
                    //NavigationView{
                     VStack{
                         // NavigationView{
                            
                        
                        VStack{
                            
                            if self.selectedTab == 1 {
                                ZStack{
                                    TransferDescriptionListView()
                                }
                                .padding(.top,100)
                            }
                            
                            else if self.selectedTab == 2 {
                                ZStack{
                                    TransferTeamView()
                                }
                                .padding(.top,120)
                            }
                            else if self.selectedTab == 3{
                               ZStack{
                                    TransferFeesView()
                                }
                                .padding(.top,100)
                            }
                            
                            
                            //Color.red
                        }.frame(width:geometry.size.width,height: geometry.size.height / 1)
                        
                        HStack{
                            
                            HStack{
                                VStack(alignment:.center){
                                   //VStack(alignment:.center){

                                            //VStack{
                                                
                                                Image(systemName: "pencil.and.ellipsis.rectangle")
                                                .resizable()
                                                .scaledToFit()
                                                        .frame(width:60 , height: 40)
                                                    .offset(x: self.shaked ? -5 : 0)
                                                    .animation(Animation.easeInOut.repeatForever().speed(1))
                                    Text("رسوم النقل").fontWeight(.medium)
                                            //}
                                            
                                    Spacer()

                                      //  }
                                }.frame(width:(geometry.size.width / 3))
                                .padding(.top,10)
                                    //.border(self.selectedTab == 3 ? Color.orange : Color.white , width: 4)
                                 .foregroundColor(self.selectedTab == 3 ? .black : .gray)
                                 .onTapGesture {
                                        self.selectedTab = 3
                                }
                                .onAppear(){
                                            self.shaked = true
                                }
                                
                                
                                VStack(alignment:.center){
                                    //VStack(alignment:.center){
                                        //VStack{
                                            Image(systemName: "gear")
                                            .resizable()
                                            .scaledToFit()
                                                    .frame(width:60 , height:40)
                                                .rotationEffect(.degrees(self.spin ? 360: 0))
                                            //.offset(x: 20, y: 200)
                                                //.animation(Animation.spring().repeatForever(autoreverses:false))
                                                .onAppear(){
                                                 //DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                                                         self.spin = true
                                                     }
                                                 //}

                                            }
                                        //}
                                        
                                        Text("فريق العمل").fontWeight(.medium)
                                            //.multilineTextAlignment(.center).lineLimit(2)
                                        
                                     Spacer()
                                        
                                    //}
                                }.frame(width:(geometry.size.width / 3))
                                    .padding(.top,10)
                                //.border(self.selectedTab == 2 ? Color.orange : Color.white , width: 4)
                                .foregroundColor(self.selectedTab == 2 ? .black : .gray)
                                .onTapGesture {
                                        self.selectedTab = 2
                                }
                                
                                
                                VStack(alignment: .center){
                                    //VStack(alignment:.center){
                                    //Spacer()
                                            if self.imageTransation {
                                            Image(systemName:"text.bubble.fill")// : "bubble.left.fill")
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                                .frame(width:60 , height: 40)
                                                .transition(.repeating(from: Opacity(0), to: Opacity(1)))
                                                                            
                                            
                                            }
                                            Text("النقل المدرسى").fontWeight(.medium)
                                             
                                        //}.onAppear(){self.imageTransation = true }
                                    
                                    Spacer()
                                    
                                }.frame(width:(geometry.size.width / 3))
                                .padding(.top,10)
                                //.border(self.selectedTab == 1 ? Color.orange : Color.white , width: 4)
                                .foregroundColor(self.selectedTab == 1 ? .black : .gray)
                                .onTapGesture {
                                        self.selectedTab = 1
                                }
                                .onAppear(){self.imageTransation = true }
                                
                            }
                        }.frame(width:geometry.size.width,height: (geometry.size.height / 4))
                        .background(Color.white.shadow(radius: 2))
                           
                            
                             
                            
                            
                          
                         // }.frame(width: geometry.size.width,height: geometry.size.height)
                         
                         
                         
                       }.frame(width: geometry.size.width,height: geometry.size.height )
                 
                 //.navigationBarTitle("رئيسي",displayMode: .inline)
                            //.navigationBarHidden(true)
                 
                 //}.frame(width: geometry.size.width,height: geometry.size.height)//.padding(.top,10)
                 
                       
                }
                   }
             

    }






    struct TransferDescriptionListView: View {
        
         @ObservedObject var TModel = TransferModel()
         //var url = "https://mobdenapi.azurewebsites.net/"
         //var prizesUrl = "assets/prizes/"
         
         init(){
            self.TModel.getTransferDescriptions()
         }
         
         
         var body: some View{
             
             
             GeometryReader{ geometry in
                 VStack{
                   NavigationView{
                      VStack{
                          
                        List(self.TModel.transferDescriptions){ info in
                            
                            
                            NavigationLink(destination: ComprehensiveInfoView(id: info.id) ){
                                
                                VStack{
                                    HStack{
                                            Spacer()
                                            Text(info.title)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                                                      
                                          }.frame(alignment:.top)
                                                              
                                      }.frame(height:100)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                
                                
                            }
                            
                                                              
                         }
                          
                                          
                                          
                      }//.padding([.trailing,.leading],10)
                          .frame(width:geometry.size.width)
                        .navigationBarTitle("النقل المدرسى",displayMode: .inline)
                        //.navigationBarHidden(true)
                      }.frame(width: geometry.size.width)
                     
                     
                     
                   }
             
             
             
             }//.padding(.top,10)
             
             
             
               }
         
        
    }




    struct TransferDescriptionInfoView: View {
        @ObservedObject var TModel = TransferModel() //ArticleModel(getArticleByID:)
            //var url = "https://mobdenapi.azurewebsites.net/"
            //var articleUrl = "assets/articles/"
            
            init(id: Int) {
                
                //self.articleModel = ArticleModel()
                self.TModel.getTransferDescriptionByID(id: id)
            }
            
            var body: some View {
                
                GeometryReader{ geometry in
                
                ScrollView{
                
                
                VStack{
                    
                    //ForEach(self.articleModel.articles){ article in
                        
                                            //VStack{
        //                                     HStack{
        //                                         Spacer()
        //                                         Text(article.arabicDate)
        //                                         .padding([.trailing],5)
        //                                         //.flipsForRightToLeftLayoutDirection(true)
        //                                     }
                                             HStack{
                                                 Spacer()
                                                Text(self.TModel.transferDescriptionInfo.title)
                                                     //.flipsForRightToLeftLayoutDirection(true)
                                                     .font(.headline)
                                                     .multilineTextAlignment(.trailing)
                                                     .lineLimit(3)
                                                     .padding([.trailing],5)
                                                     //.alignmentGuide(.trailing){d in d[.trailing]}
                                                 
                                             }
                                             
                            
                            
                                           // }
                                            
                                           // VStack{
        //                                        UrlImageView(urlString:(self.url + self.articleUrl + article.image),width: 400,height: 300)
                     
                     
                                            
                     //VStack{
                    Text(self.TModel.transferDescriptionInfo.description)
                             //.flipsForRightToLeftLayoutDirection(true)
                             .font(.body)
                            //.padding()
                        //.flipsForRightToLeftLayoutDirection(true)
                             .lineSpacing(5)
                                           //.fixedSize(horizontal: false, vertical: true)
                             .multilineTextAlignment(.trailing)
                            .padding(10)
                             //.lineLimit(Int.max)

                    //}
                                            
                      
                                                        
                    //}
                    
                                    
                                    
                }//.padding(10)
                    //.frame(width:geometry.size.width )
                                
                                    //.padding([.trailing],30)
                    .background(Color.gray.opacity(0.2))
                               // .cornerRadius(15)
                }.frame(width: geometry.size.width - 20)
                }
        .navigationBarTitle("توضيح",displayMode: .inline)
            }
    }



    struct TransferTeamView: View {
        
         @ObservedObject var TModel = TransferModel()
         var url = "https://mobdenapi.azurewebsites.net/"
         var personUrl = "assets/persons/"
         
         init(){
            self.TModel.getTransferTeam()
         }
         
         
         var body: some View{
             
             
             GeometryReader{ geometry in
                      
                
                 
                 //VStack{
                    
                      //NavigationView{
                        
                if self.TModel.transferTeams.isEmpty {
                            VStack(alignment:.center){
                                Text("فارغ").frame(width:200,height:200)
                                    .background(Color.red.opacity(0.3))
                                .cornerRadius(9)
                            }.frame(height: 250).offset(x:(geometry.size.width / 2 ) - 100 , y: (geometry.size.height / 2) - 100)
                        }
                        else {
                        
                      
                      VStack{
                          
                        List(self.TModel.transferTeams){ info in
                            
                            
                            //NavigationLink(destination: PublicRelationInfoView(publicRelationID: info.id) ){
                                
                                VStack{
                                    HStack{
                                        
                                        Spacer()
                                        
                                        VStack{
                                            Text(info.name)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                            Text(info.status)
                                                .foregroundColor(.secondary)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                            Text(info.roleDescription)
                                                .foregroundColor(.secondary)
                                            .padding(8)
                                            .flipsForRightToLeftLayoutDirection(true)
                                            .lineSpacing(2)
                                            .multilineTextAlignment(.trailing)
                                        }
                                        UrlImageView(urlString:(self.url + self.personUrl + info.image),width: 100,height: 100)
                                            .cornerRadius(8)
                                        
                                                                      
                                          }
                                                              
                                }.frame(height:100)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                    //.padding(.trailing,10)
                                
                                
                            //}
                            
                              
                           
                                                                          
                                                                  
                            
                                                              
                         }
                          
                                          
                                          
                      }//.padding([.trailing,.leading],10)
                          //.frame(width:geometry.size.width)
                        //.navigationBarTitle("فريق العمل",displayMode: .inline)
                        //.navigationBarHidden(true)
                      //}.frame(width: geometry.size.width)
                     
                     
                     
                   //}
             
             
             
             //}//.padding(.top,10)
    //         .navigationBarItems(leading: NavigationLink(destination: SupervisionView()) {
    //                 Text("Nav")
    //                 }
    //         )
             
                }
               }
        }
         
        
    }



struct TransferFeesView: View {
    
    
    
    @ObservedObject var TModel = TransferModel()
    
    init(){
        self.TModel.getTrnasferFees()
    }
    
    
    var body: some View{
        
        
        
        
        
        
        GeometryReader{ geometry in
                 
           
            
            VStack{
                VStack{
                           Text("رسوم النقل المدرسي")
                               .font(.headline)
                               .frame(width: 400, height: 50, alignment: .center)
                               .background(Color.gray.opacity(0.5))
                           .cornerRadius(10)
                            .padding([.top,.trailing,.leading],10)
                           }
            
                 ScrollView{
                 
                 
                 VStack{
                     
                    ForEach(self.TModel.transferFees){ finance in
                         
                        VStack(spacing: 5){
                                             HStack{
                                                                        Spacer()
                                                                        
                                            //                            Text(self.getStageName(id: finance.stage))
                                                                        Text(finance.name)
                                                                        Text("النقل")
                                                                            .font(.headline)
                                                                            .frame(width: 100,height:30)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(4)
                                                                        .padding(10)
                                                                    }
                                                                    HStack{
                                                                        Spacer()
                                                                        
                                                                        Text(finance.feesString)
                                                                        Text("الرسوم")
                                                                            .font(.headline)
                                                                        .frame(width: 100,height:30)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(4)
                                                                        .padding(10)
                                                                    }
                                                                    VStack{
                                                                        Text("الملاحظات")
                                                                            .font(.subheadline)
                                                                        .frame(width: 350, height: 30, alignment: .center)
                                                                            .background(Color.red.opacity(0.5))
                                                                        .cornerRadius(10)
                                                                        .padding(10)
                                                                        Text(finance.notes)
                                                                            .padding([.bottom], 10)
                                                                        
                                                                    }.padding( 5)
                                             
                        }.frame(width: 400)
                            .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(10)
                                                         
                    }
                     
                                     
                                     
                 }.padding([.trailing,.leading],10)
                     .frame(width:geometry.size.width)
                                 
                                     //.padding([.trailing],30)
                                     //.background(Color.gray.opacity(0.2))
                                // .cornerRadius(15)
                 }.frame(width: geometry.size.width)
                
                
                
                
                

                Spacer()
               
                
                
                
              }
        
        
        
        
        
        
        
        }.padding(.top,10)
        
        
        
          }
    
    
    
    
    
    
}





  
struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}
