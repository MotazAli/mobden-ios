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
    
    var body: some View {
        
        
        
        
        ZStack{
        
            
            VStack{
                
                HStack{
                    Spacer()
                    Text(" طلائع المبدعين الاهلية للبنين").font(.title).lineLimit(nil)
                   
                    Button(action: {
                        
                        
                        if self.selectedTabView == 0{
                            self.masterSilderOpen.toggle()
                            
                        }
                        
                        if self.selectedTabView == 1{
                            self.primarySchoolSliderOpen.toggle()
                            
                        }
                        
                    })
                    {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    
                }
                
                //Spacer()
                
                
                TabView(selection: self.$selectedTabView){
                    
                    Text("الثانوي").tabItem{
                        VStack{
                            Image(systemName: "person.3.fill").font(.title)
                            Text("الثانوي").font(.largeTitle)
                        }
                        //Text("الثانوي")
                        
                    }.tag(3)
                    
                    
                    Text("المتوسط").tabItem{
                        VStack{
                            Image(systemName: "person.2.fill").font(.title)
                            Text("المتوسط").font(.largeTitle)
                        }
                        
                        
                    }.tag(2)
                    
                    
                    
                    VStack{
                    
                        Text("الابتدائي")
                        
                    }.tabItem{
                            
                            VStack{
                                Image(systemName: "person.fill").font(.title)
                                Text("الابتدائي").font(.largeTitle)
                            }
                        
                        
                        
                        
                    }.tag(1)
                    
                    HomeMasterView().tabItem{
                        VStack{
                            Image(systemName: "house.fill").font(.title)
                            Text("الرئيسية").font(.largeTitle)
                        }
                        
                        
                    }.tag(0)
                    
                }
                
            }.padding()
            
            
        
            
            
            MasterMenuSlider(masterSilderOpen: self.$masterSilderOpen)
            
            PrimarySchoolSliderMenu(primarySchoolSliderOpen: self.$primarySchoolSliderOpen)
            
        }
       
        
    }
    

}


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
