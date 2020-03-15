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
                
                if dataString != "null"{
                let data = Data(dataString.utf8)
                let wordsData = try! JSONDecoder().decode(Word.self, from: data)
               
                DispatchQueue.main.async {
                                 self.words.append(wordsData)
                }
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
    @Published var PrimaryArticles = [Article]()
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
                
                if dataString != "null"{
                
                let data = Data(dataString.utf8)
                let articlesData = try! JSONDecoder().decode([Article].self, from: data)
               
                DispatchQueue.main.async {
                                 self.articles = articlesData
                }
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
                
                if dataString != "null"{
                let data = Data(dataString.utf8)
                let articlesData = try! JSONDecoder().decode(Article.self, from: data)
               
                DispatchQueue.main.async {
                    self.articles.append( articlesData)
                    print("count \(self.articles.count)")
                }
                }
                

                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    func getTopThreeArticleByStage(id: Int)
        {

            PrimaryArticles.removeAll()
            var articleObject = Article()
            articleObject.stage = id
            
//            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Article/GetTopThreeArticleByStage")
            
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Article/GetArticleByStage")
            
            guard let requestUrl = url else { fatalError() }
            // Create URL Request
            var request = URLRequest(url: requestUrl)
            // Specify HTTP Method to use
            //request.httpMethod = "GET"
            
            
            let jsonData = try! JSONEncoder().encode(articleObject)
            //let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpMethod = "POST" //set http method as POST
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            
            
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let articlesData = try! JSONDecoder().decode([Article].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.PrimaryArticles = articlesData
                                        
                                       }
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
                
                if dataString != "null"{
                
                let data = Data(dataString.utf8)
                
                let AboutSchoolData = try! JSONDecoder().decode([AboutSchool].self, from: data)
               
                DispatchQueue.main.async {
                                 self.aboutSchoolList = AboutSchoolData
                }
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



final class HonorBoardlModel: ObservableObject{
    
    @Published var honorBoardList = [HonorBoard]()
    @Published var honorBoardStageList = [HonorBoard]()
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getAllHonorBoard()
    {

        honorBoardList.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/HonorBoard/GetManagmentHonorBoards")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let honorBoardlData = try! JSONDecoder().decode([HonorBoard].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                                    self.honorBoardList = honorBoardlData
                                   }
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
    
    
    
    
    
    
    
    
    func getHonorBoardByStage(id : Int)
        {

            honorBoardStageList.removeAll()
            
            var urlString = ""
            if id == 1 {
                urlString  =  "https://mobdenapi.azurewebsites.net/MobdenAPI/HonorBoard/GetPrimaryHonorBoards"
            }
            else if id == 2 {
                urlString  =  "https://mobdenapi.azurewebsites.net/MobdenAPI/HonorBoard/GetMiddleHonorBoards"
            }
            else if id == 3 {
                urlString  =  "https://mobdenapi.azurewebsites.net/MobdenAPI/HonorBoard/GetHighHonorBoards"
            }
            
            
            
            
            let url = URL(string:urlString)
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let honorBoardlData = try! JSONDecoder().decode([HonorBoard].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                                        self.honorBoardStageList = honorBoardlData
                                       }
                    }
                   
                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
    
    
    
    
}



final class RegistrationModel: ObservableObject{
    
    @Published var registerFinances = [RegisterFinance]()
    @Published var registrationRequiredList = [RegistrationsRequired]()
    @Published var registrationRequiredInfo = RegistrationsRequired(id: 0, title: "", description: "", creationDate: "")
//    init() {
//        getRegistrationFinanace()
//    }
    
    
    
      func getRegistrationFinanace()
    {

        registerFinances.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Registration/GetRegistrationFinanace")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let rgisterFinanceData = try! JSONDecoder().decode([RegisterFinance].self, from: data)
                                  print("done")
                                   DispatchQueue.main.async {
                                                    self.registerFinances = rgisterFinanceData
                                    //print("done 2")
//                                    print("Response data string:\n \(String(describing: self.registerFinances[0].fees))")
                                   }
                }
               
                
//                print("Response data string:\n \(dataString)")
//
//                print("Response data string:\n \(String(describing: self.registerFinances[0].fees))")
//
//
//                print("Response data string:\n \(String(describing: self.words[0].title))")
                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
    

          func getRequiredForRegistration()
        {

            registrationRequiredList.removeAll()
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Registration/GetRequiredForRegistration")
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let rgisterData = try! JSONDecoder().decode([RegistrationsRequired].self, from: data)
                                      print("done")
                                       DispatchQueue.main.async {
                                        self.registrationRequiredList = rgisterData
                                        //print("done 2")
    //                                    print("Response data string:\n \(String(describing: self.registerFinances[0].fees))")
                                       }
                    }
                   
                    
    //                print("Response data string:\n \(dataString)")
    //
    //                print("Response data string:\n \(String(describing: self.registerFinances[0].fees))")
    //
    //
    //                print("Response data string:\n \(String(describing: self.words[0].title))")
                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
    
    

         func getRequiredForRegistrationByID(id : Int)
        {

            
            
    //        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
    //        guard let requestUrl = url else { fatalError() }
            
            
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Registration/GetRequiredForRegistrationByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(RegistrationsRequired.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.registrationRequiredInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
    
    
    
    
}






final class PrizesModel: ObservableObject{
    
    @Published var prizes = [Prize]()
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getPrizes()
    {

        prizes.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Prizes/GetPrizes")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let prizeslData = try! JSONDecoder().decode([Prize].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                    self.prizes = prizeslData
                                   }
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







final class PublicRelationModel: ObservableObject{
    
    @Published var publicRelations = [PublicRelation]()
    @Published var publicRelationInfo = PublicRelation(id: 0, title: "لا يوجد", description: "لا يوجد")
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getPublicRelations()
    {

        publicRelations.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/PublicRelations/GetPublicRelations")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let publicRelationlData = try! JSONDecoder().decode([PublicRelation].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                    self.publicRelations = publicRelationlData
                                   }
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
    
    
    
    
    

         func getPublicRelationByID(id : Int)
        {

            
            
    //        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
    //        guard let requestUrl = url else { fatalError() }
            
            
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/PublicRelations/GetPublicRelationByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(PublicRelation.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.publicRelationInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
        
        
    
    
    
    
    
}


final class SupervisionAndDevelopmentModel: ObservableObject{
    
    @Published var supervisionAndDevelopments = [SupervisionAndDevelopment]()
    @Published var supervisionAndDevelopmentInfo = SupervisionAndDevelopment(id: 0, title: "لا يوجد", description: "لا يوجد")
    @Published var supervisionTeams = [SupervisionTeam]()
    @Published var supervisionPlans = [SupervisionPlan]()
    @Published var studentSupervisionList = [StudentSupervision]()
    @Published var studentSupervisionInfo = StudentSupervision()
    //@Published var studentSupervisionPlansList = [ManagmentDepartmentPlan]()
    
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getAboutSupervisions()
    {

        supervisionAndDevelopments.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/SupervisionAndDevelopment/GetAboutSupervisions")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let supervisionAndDevelopmentData = try! JSONDecoder().decode([SupervisionAndDevelopment].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                    //print("done")
                                    self.supervisionAndDevelopments = supervisionAndDevelopmentData
                                    
                                   }
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
    
    
    
    
    

         func getAboutSupervisionByID(id : Int)
        {

            
            
    //        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
    //        guard let requestUrl = url else { fatalError() }
            
            
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/SupervisionAndDevelopment/GetAboutSupervisionByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(SupervisionAndDevelopment.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.supervisionAndDevelopmentInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
        
        
    func getSupervisionTeam()
        {

            supervisionTeams.removeAll()
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/SupervisionAndDevelopment/GetSupervisionTeam")
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let supervisionTeamsData = try! JSONDecoder().decode([SupervisionTeam].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.supervisionTeams = supervisionTeamsData
                                        
                                       }
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
        
        
        func GetManagmentDepartmentPlansByDep()
            {

                supervisionPlans.removeAll()
                let MDPlanObject = ManagmentDepartmentPlan(id: 0, linkTitle: nil, planFile: nil, departmentID: 5, creationDate: nil, modifiedDate: nil, creationUserId: 0, modifiedUserId: 0)
                
                let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentDepartmentPlans/GetManagmentDepartmentPlansByDep")
                guard let requestUrl = url else { fatalError() }
                // Create URL Request
                var request = URLRequest(url: requestUrl)
                // Specify HTTP Method to use
                //request.httpMethod = "GET"
                
                
                let jsonData = try! JSONEncoder().encode(MDPlanObject)
                //let jsonString = String(data: jsonData, encoding: .utf8)!
                request.httpMethod = "POST" //set http method as POST
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Accept")
                request.httpBody = jsonData
                
                
                
                
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
                        
                        if dataString != "null"{
                            let data = Data(dataString.utf8)
                                           let supervisionPlansData = try! JSONDecoder().decode([SupervisionPlan].self, from: data)
                                          
                                           DispatchQueue.main.async {
                                            print("done")
                                            self.supervisionPlans = supervisionPlansData
                                            
                                           }
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
        
    
    func getStudentSupervisionBy(stageId: Int)
        {

            studentSupervisionList.removeAll()
            var SV_temp = StudentSupervision()
            SV_temp.stage = stageId
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/StudentSupervision/GetStudentSupervisionByStage")
            guard let requestUrl = url else { fatalError() }
            // Create URL Request
            var request = URLRequest(url: requestUrl)
            // Specify HTTP Method to use
            //request.httpMethod = "GET"
            
            
            let jsonData = try! JSONEncoder().encode(SV_temp)
            //let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpMethod = "POST" //set http method as POST
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            
            
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let SVData = try! JSONDecoder().decode([StudentSupervision].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.studentSupervisionList = SVData
                                        
                                       }
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
    
    
    
    
    
    func GetStageDepartmentPlanBy(stageId: Int,departmentId:Int)
        {

            supervisionPlans.removeAll()
            var tempDepartment = DepartmentLeader()
               tempDepartment.stage = stageId
            tempDepartment.departmentID = departmentId
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/StageDepartmentPlans/GetStageDepartmentPlanByStageAndDep")
            guard let requestUrl = url else { fatalError() }
            // Create URL Request
            var request = URLRequest(url: requestUrl)
            // Specify HTTP Method to use
            //request.httpMethod = "GET"
            
            
            let jsonData = try! JSONEncoder().encode(tempDepartment)
            //let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpMethod = "POST" //set http method as POST
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            
            
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let MDPData = try! JSONDecoder().decode([SupervisionPlan].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.supervisionPlans = MDPData
                                        
                                       }
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
    
    
    
    
    
    
    
    func getStudentSupervisionBy(id : Int)
        {

       
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/StudentSupervision/GetStudentSupervisionByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(StudentSupervision.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.studentSupervisionInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
        
    
    
    
}

final class ComprehensiveModel: ObservableObject{
    
    @Published var comprehensives = [Comprehensive]()
    @Published var comprehensiveInfo = Comprehensive(id: 0, title: "لا يوجد", description: "لا يوجد")
    @Published var comprehensiveTeams = [DepartmentLeader]()
    @Published var comprehensivePlans = [SupervisionPlan]()
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getAboutComprehensive()
    {

        comprehensives.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Comprehensive/GetAboutComprehensive")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let comprehensivesData = try! JSONDecoder().decode([Comprehensive].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                    //print("done")
                                    self.comprehensives = comprehensivesData
                                    
                                   }
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
    
    
    
    
    

         func getAboutComprehensiveByID(id : Int)
        {

            
            
    //        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
    //        guard let requestUrl = url else { fatalError() }
            
            
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Comprehensive/GetAboutComprehensiveByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(Comprehensive.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.comprehensiveInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
        
        
    
    
    
    func getManagmentDepartmentLeaderByDep()
        {

            comprehensiveTeams.removeAll()
            let MDPlanObject = ManagmentDepartmentPlan(id: 0, linkTitle: nil, planFile: nil, departmentID: 4, creationDate: nil, modifiedDate: nil, creationUserId: 0, modifiedUserId: 0)
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentDepartmentLeader/GetManagmentDepartmentLeaderByDep")
            guard let requestUrl = url else { fatalError() }
            // Create URL Request
            var request = URLRequest(url: requestUrl)
            // Specify HTTP Method to use
            //request.httpMethod = "GET"
            
            
            let jsonData = try! JSONEncoder().encode(MDPlanObject)
            //let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpMethod = "POST" //set http method as POST
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            
            
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let teamsData = try! JSONDecoder().decode([DepartmentLeader].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.comprehensiveTeams = teamsData
                                        
                                       }
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
    
    
    
    
    
    
    
    
    
        
        
        func getManagmentDepartmentPlansByDep()
            {

                comprehensivePlans.removeAll()
                let MDPlanObject = ManagmentDepartmentPlan(id: 0, linkTitle: nil, planFile: nil, departmentID: 4, creationDate: nil, modifiedDate: nil, creationUserId: 0, modifiedUserId: 0)
                
                let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentDepartmentPlans/GetManagmentDepartmentPlansByDep")
                guard let requestUrl = url else { fatalError() }
                // Create URL Request
                var request = URLRequest(url: requestUrl)
                // Specify HTTP Method to use
                //request.httpMethod = "GET"
                
                
                let jsonData = try! JSONEncoder().encode(MDPlanObject)
                //let jsonString = String(data: jsonData, encoding: .utf8)!
                request.httpMethod = "POST" //set http method as POST
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Accept")
                request.httpBody = jsonData
                
                
                
                
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
                        
                        if dataString != "null"{
                            let data = Data(dataString.utf8)
                                           let PlansData = try! JSONDecoder().decode([SupervisionPlan].self, from: data)
                                          
                                           DispatchQueue.main.async {
                                            print("done")
                                            self.comprehensivePlans = PlansData
                                            
                                           }
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



final class TransferModel: ObservableObject{
    
    @Published var transferDescriptions = [TransferDescription]()
    @Published var transferDescriptionInfo = TransferDescription(id: 0, title: "لا يوجد", description: "لا يوجد")
    @Published var transferTeams = [Team]()
    @Published var transferFees = [Fees]()
    
//    init() {
//        fetchPosts()
//    }
    
    
    
     func getTransferDescriptions()
    {

        transferDescriptions.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Transfer/GetTransferDescriptions")
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
                
                if dataString != "null"{
                    let data = Data(dataString.utf8)
                                   let TData = try! JSONDecoder().decode([TransferDescription].self, from: data)
                                  
                                   DispatchQueue.main.async {
                                    //print("done")
                                    self.transferDescriptions = TData
                                    
                                   }
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
    
    
    
    
    

         func getTransferDescriptionByID(id : Int)
        {

            
            
    //        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/ManagmentArticles/GetArticles")
    //        guard let requestUrl = url else { fatalError() }
            
            
            
            
            
            let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Transfer/GetTransferDescriptionByID")
            
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
                    
                    if dataString != "null"{
                    let data = Data(dataString.utf8)
                    let infoData = try! JSONDecoder().decode(TransferDescription.self, from: data)
                   
                    DispatchQueue.main.async {
                        self.transferDescriptionInfo = infoData
                        //self.articles.append( articlesData)
                        //print("count \(self.articles.count)")
                    }
                    }
                    

                    
                }
                
            }
            task.resume()
            
            
            
            
        }
        
        
        
    func getTransferTeam()
        {

            transferTeams.removeAll()
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Transfer/GetTransferTeam")
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let TData = try! JSONDecoder().decode([Team].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        //print("done")
                                        self.transferTeams = TData
                                        
                                       }
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
        
    
    
    
    func getTrnasferFees()
        {

            transferFees.removeAll()
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Transfer/GetTrnasferFees")
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let TData = try! JSONDecoder().decode([Fees].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        //print("done")
                                        self.transferFees = TData
                                        
                                       }
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

final class NewsModel: ObservableObject{
    
    @Published var newsList = [News]()
    @Published var topThreeNews = [News]()
    //@Published var primaryNews = [News]()
    @Published var news = News()
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
    
    
    
     func getNews()
    {

        newsList.removeAll()
        
        let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/News/GetNews")
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
                
                if dataString != "null"{
                
                let data = Data(dataString.utf8)
                let newsData = try! JSONDecoder().decode([News].self, from: data)
               
                DispatchQueue.main.async {
                                 self.newsList = newsData
                }
                }

                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
     func getNewsByID(id : Int)
    {

        
        
        
        let urlComponent = NSURLComponents(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/News/GetNewsByID")
        
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
                
                if dataString != "null"{
                let data = Data(dataString.utf8)
                let newsData = try! JSONDecoder().decode(News.self, from: data)
               
                DispatchQueue.main.async {
                    self.news = newsData
                    print(self.news.newsImages)
                }
                }
                

                
            }
            
        }
        task.resume()
        
        
        
        
    }
    
    
    
    func getThreeNewsByStage(id: Int)
        {

            topThreeNews.removeAll()
            var tempNews = News()
            tempNews.stage = id
            
//            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Article/GetTopThreeArticleByStage")
            
            
            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/News/GetThreeNewsByStage")
            
            guard let requestUrl = url else { fatalError() }
            // Create URL Request
            var request = URLRequest(url: requestUrl)
            // Specify HTTP Method to use
            //request.httpMethod = "GET"
            
            
            let jsonData = try! JSONEncoder().encode(tempNews)
            //let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpMethod = "POST" //set http method as POST
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            
            
            
            
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
                    
                    if dataString != "null"{
                        let data = Data(dataString.utf8)
                                       let newsData = try! JSONDecoder().decode([News].self, from: data)
                                      
                                       DispatchQueue.main.async {
                                        print("done")
                                        self.topThreeNews = newsData
                                        
                                       }
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
    
    
    func getNewsByCategoryID(id: Int)
            {

                newsList.removeAll()
                var tempNews = News()
                tempNews.stage = id
                
    //            let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Article/GetTopThreeArticleByStage")
                
                
                let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/News/GetNewsByCategoryID")
                
                guard let requestUrl = url else { fatalError() }
                // Create URL Request
                var request = URLRequest(url: requestUrl)
                // Specify HTTP Method to use
                //request.httpMethod = "GET"
                
                
                let jsonData = try! JSONEncoder().encode(tempNews)
                //let jsonString = String(data: jsonData, encoding: .utf8)!
                request.httpMethod = "POST" //set http method as POST
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Accept")
                request.httpBody = jsonData
                
                
                
                
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
                        
                        if dataString != "null"{
                            let data = Data(dataString.utf8)
                                           let newsData = try! JSONDecoder().decode([News].self, from: data)
                                          
                                           DispatchQueue.main.async {
                                            print("done")
                                            self.newsList = newsData
                                            
                                           }
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

final class LeadershipModel: ObservableObject{
    
    @Published var leadershipList = [Leadership]()
    //@Published var topThreeNews = [News]()
    //@Published var primaryNews = [News]()
    //@Published var news = News()
    
    
    
    
     
        func getLeadershipByStage(id: Int)
            {

                leadershipList.removeAll()
                var tempLeadership = Leadership()
                tempLeadership.stage = id
               
                
                let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/Leadership/GetLeadershipByStage")
                
                guard let requestUrl = url else { fatalError() }
                // Create URL Request
                var request = URLRequest(url: requestUrl)
                // Specify HTTP Method to use
                //request.httpMethod = "GET"
                
                
                let jsonData = try! JSONEncoder().encode(tempLeadership)
                //let jsonString = String(data: jsonData, encoding: .utf8)!
                request.httpMethod = "POST" //set http method as POST
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Content-Type")
                request.setValue("application/json; charset=utf-8",
                     forHTTPHeaderField: "Accept")
                request.httpBody = jsonData
                
                
                
                
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
                        
                        if dataString != "null"{
                            let data = Data(dataString.utf8)
                                           let leadershipData = try! JSONDecoder().decode([Leadership].self, from: data)
                                          
                                           DispatchQueue.main.async {
                                            print("done")
                                            self.leadershipList = leadershipData
                                            
                                           }
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





final class DepartmentLeaderModel: ObservableObject{
    
    @Published var departmentLeaderList = [DepartmentLeader]()
    //@Published var topThreeNews = [News]()
    //@Published var primaryNews = [News]()
    @Published var departmentLeader = DepartmentLeader()
    
    
    
    func getStageDepartmentLeaderByStageAndDep(stageId: Int,departmentId:Int)
           {

               departmentLeaderList.removeAll()
               var tempDepartmentLeader = DepartmentLeader()
               tempDepartmentLeader.stage = stageId
            tempDepartmentLeader.departmentID = departmentId
              
               
               let url = URL(string: "https://mobdenapi.azurewebsites.net/MobdenAPI/StageDepartmentLeader/GetStageDepartmentLeaderByStageAndDep")
               
               guard let requestUrl = url else { fatalError() }
               // Create URL Request
               var request = URLRequest(url: requestUrl)
               // Specify HTTP Method to use
               //request.httpMethod = "GET"
               
               
               let jsonData = try! JSONEncoder().encode(tempDepartmentLeader)
               //let jsonString = String(data: jsonData, encoding: .utf8)!
               request.httpMethod = "POST" //set http method as POST
               request.setValue("application/json; charset=utf-8",
                    forHTTPHeaderField: "Content-Type")
               request.setValue("application/json; charset=utf-8",
                    forHTTPHeaderField: "Accept")
               request.httpBody = jsonData
               
               
               
               
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
                       
                       if dataString != "null"{
                           let data = Data(dataString.utf8)
                                          let DLData = try! JSONDecoder().decode([DepartmentLeader].self, from: data)
                                         
                                          DispatchQueue.main.async {
                                           print("done")
                                           self.departmentLeaderList = DLData
                                           
                                          }
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






