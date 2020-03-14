//
//  ContentView.swift
//  mobden
//
//  Created by administrator on 2/20/20.
//  Copyright © 2020 motaz. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
   
    @State var masterSilderOpen = false
    @State var highSchoolSliderOpen = false
    @State var middleSchoolSliderOpen = false
    @State var primarySchoolSliderOpen = false
    @State var selectedTabView = 0
    @State var isMasterHomeView : Bool = true
    
    
//
//    init(){
//
//        UITabBar.appearance().backgroundColor = UIColor.clear
//    }
    
    
    
    var body: some View {
        
        
        
        
        ZStack{
        
            
            VStack{
                
                HStack{
                    
                    Image("logo2").resizable().scaledToFit().frame(width:90,height:80)
                    Spacer()
                    Text(" طلائع المبدعين الاهلية للبنين").font(.system(size: 20)).fontWeight(.bold)
                   Spacer()
                    Button(action: {
                        
                        
                        if self.selectedTabView == 0{
                            self.masterSilderOpen.toggle()
                            
                        }
                        
                        if self.selectedTabView == 1{
                            self.primarySchoolSliderOpen.toggle()
                            
                        }
                        
                        if self.selectedTabView == 2{
                            self.middleSchoolSliderOpen.toggle()
                            
                        }
                        
                        if self.selectedTabView == 3{
                            self.highSchoolSliderOpen.toggle()
                            
                        }
                        
                    })
                    {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                }.padding(.horizontal,10).frame(height:50)
                
                //Spacer()
                
                
                TabView(selection: self.$selectedTabView){
                    
                    HighSchoolHomeView().tabItem{
                        VStack{
                            Image(systemName: "person.3.fill").font(.title)
                            Text("الثانوي").font(.largeTitle)
                        }
                       
                        
                    }.tag(3).tag(2).padding([.horizontal, .top],10)
                    .onAppear(){self.isMasterHomeView = false}
                    
                    
                    MiddleSchoolHomeView().tabItem{
                        VStack{
                            Image(systemName: "person.2.square.stack.fill").font(.title)//systemName: "person.2.fill").font(.title)
                            Text("المتوسط").font(.largeTitle)
                        }
                        
                        
                    }.tag(2).padding([.horizontal, .top],10)
                    .onAppear(){self.isMasterHomeView = false}
                    
                    
                    
                    PrimarySchoolHomeView().tabItem{
                            
                            VStack{
                                Image(systemName: "rectangle.stack.person.crop.fill").font(.title)//systemName: "person.fill").font(.title)
                                Text("الابتدائي").font(.largeTitle)
                            }
                        
                        
                        
                        
                    }.tag(1).padding([.horizontal, .top],10)
                        .onAppear(){self.isMasterHomeView = false}
                    
                    HomeMasterView().tabItem{
                        VStack{
                            //self.isMasterHomeView = true
                            VStack{
                            Image(systemName: "house.fill").font(.title)
                            Text("الرئيسية").font(.largeTitle)
                            }
                        }
                        
                        
                    }.tag(0).padding([.horizontal, .top],10)
                        .onAppear(){ self.isMasterHomeView = true}
                    
                }
                
            }
            
            
        
            
            
            MasterMenuSlider(masterSilderOpen: self.$masterSilderOpen)
            
            PrimarySchoolSliderMenu(primarySchoolSliderOpen: self.$primarySchoolSliderOpen)
            
            MiddleSchoolSliderMenu(middleSchoolSliderOpen: self.$middleSchoolSliderOpen)
            
            HighSchoolSliderMenu(highSchoolSliderOpen: self.$highSchoolSliderOpen)
            
        }
        .background(self.isMasterHomeView ? Color.red.opacity(0.8).edgesIgnoringSafeArea(.all): Color.blue.opacity(0.8).edgesIgnoringSafeArea(.all) )
       
        
    }
    

}




//extension UITabBarController {
//    override open func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let standardAppearance = UITabBarAppearance()
//
//        //standardAppearance.configureWithOpaqueBackground()
//
//        standardAppearance.configureWithTransparentBackground()
//
//        tabBar.standardAppearance = standardAppearance
//    }
//}








struct ArticalsMainGroupView :View{
    var body:some View{
        
        
         VStack(alignment:.center){
                                               
                                               Image("company_logo").resizable().frame(width: 300, height: 200, alignment: .center).scaledToFit();                                        Text("fdgsdfdbrghfghfghyjdfhdhdhgdfghsdfgsdbghgnfgbdfsdfhggbsdbfsdbsgjfndfnsdbsdnhdnsfgbs")
                                               
                                           }.frame(width: 300, height: 400, alignment: .center)
    }
}



struct LoginView: View {
    
    @State var authenticated: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    let lightGreyColor = Color(red: 210.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 6.0)
    
    
    
    
     var body: some View {
        
                    VStack {
                        
                       
                        
                       
                        
                        Image("company_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 200)                    .clipped()
                        .cornerRadius(150)
                        .padding(.bottom, 20)
                        
                        
                         Text("مدارس طلائع المبدعين")
                                               .font(.largeTitle)
                                           .fontWeight(.semibold)
                                               .padding(.bottom, 20)
                            
                        
                        TextField("اسم المستخدم", text: $username)
                                        .padding()
                                        .background(lightGreyColor)
                                        .cornerRadius(5.0)
                          .padding(.bottom, 20)
                        SecureField("كلمه المرور", text: $password)
                                        .padding()
                                        .background(lightGreyColor)
                                        .cornerRadius(5.0)
                                        .padding(.bottom, 20)
                        
                        
                       Button(action: {
                                                        }) {
                                     Text("دخول")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 220, height: 60)
                                        .background(Color.blue)
                                    .cornerRadius(15.0)
                                    
                                    
                                 }

                        
                    }
        .padding()
    }
}




struct HomeView: View {
     var body: some View {
        Text("Welcome")
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
