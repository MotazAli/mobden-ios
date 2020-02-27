//
//  RegistrationView.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    var body: some View{
        
        VStack{
            VStack{
                Text("إجراءات التسجيل للطلاب المستجدين")
                    .font(.headline)
                    .frame(width: 400, height: 50, alignment: .center)
                    .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
                }
              
            ScrollView{

                ForEach(0..<4){ number in
                    
                    VStack(spacing: 5){
                        HStack{
                            Spacer()
                            
                            Text("المرحله الثانويه")
                            Text("المرحله")
                                .font(.headline)
                                .frame(width: 100,height:30)
                                .background(Color.red.opacity(0.5))
                            .cornerRadius(4)
                            .padding(10)
                        }
                        HStack{
                            Spacer()
                            
                            Text("15000")
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
                            Text("تم خصم 1000 ريال لتصبح الرسوم 14000")
                                .padding([.bottom], 10)
                            
                        }.padding( 5)
                    }.frame(width: 400)
                        .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(10)
                }
            }
            
            
            
            Spacer()
            Text("ملحوظة هامة : توجد تسهيلات في تسديد الرسوم وذلك بالتنسيق مع الإدارة المالية .")
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
