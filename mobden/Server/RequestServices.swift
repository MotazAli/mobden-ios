//
//  RequestServices.swift
//  mobden
//
//  Created by administrator on 2/26/20.
//  Copyright © 2020 motaz. All rights reserved.
//
import Foundation
import SwiftUI
import Combine


final class WordModel: ObservableObject{
    
    @Published var words = [Word]()
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getWord()
    {

        words.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Word/GetWord")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let data = Data(dataString.utf8)
                let wordsData = try! JSONDecoder().decode(Word.self, from: data)
               
                DispatchQueue.main.async {
                                 self.words.append(wordsData)
                }
                
//                print("Response data string:\n \(dataString)")
//
//                print("Response data string:\n \(String(describing: wordsData.title))")
//
//
//                print("Response data string:\n \(String(describing: self.words[0].title))")
                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
}







final class ArticleModel: ObservableObject{
    
    @Published var articles = [Article]()
    //@Binding var getArticleByID : Int
    
//    init()
//    {
//        self.fetchPosts()
//    }
    
//    init(getArticleByID: Int = 0) {
//
//
//
//        if getArticleByID > 0 {
//            self.getArticleByID(id:getArticleByID)
//        }
//
//    }
    
    
    
     func getTopThreeArticles()
    {

        articles.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let data = Data(dataString.utf8)
                let articlesData = try! JSONDecoder().decode([Article].self, from: data)
               
                DispatchQueue.main.async {
                                 self.articles = articlesData
                }
                

                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
     func getArticleByID(id : Int)
    {

        
        
//        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
//        guard let requestUrl = url else { fatalError() }
        
        
        
        articles.removeAll()
        
        let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticleByID")
        
        urlComponent?.queryItems = [
            (NSURLQueryItem(name: "id", value: String(describing: id)) as URLQueryItem)
        ]
        
        
        
        //guard let requestUrl = url else { fatalError() }
        guard let requestUrl = urlComponent?.url else { fatalError() }
        
        
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let data = Data(dataString.utf8)
                let articlesData = try! JSONDecoder().decode(Article.self, from: data)
               
                DispatchQueue.main.async {
                    self.articles.append( articlesData)
                    print("count \(self.articles.count)")
                }
                

                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
    
    
    
}



final class AboutSchoolModel: ObservableObject{
    
    @Published var aboutSchoolList = [AboutSchool]()
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getAboutSchool()
    {

        aboutSchoolList.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/AboutSchool/GetAboutSchool")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let data = Data(dataString.utf8)
                let AboutSchoolData = try! JSONDecoder().decode([AboutSchool].self, from: data)
               
                DispatchQueue.main.async {
                                 self.aboutSchoolList = AboutSchoolData
                }
                
//                print("Response data string:\n \(dataString)")
//
//                print("Response data string:\n \(String(describing: wordsData.title))")
//
//
//                print("Response data string:\n \(String(describing: self.words[0].title))")
                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
}


