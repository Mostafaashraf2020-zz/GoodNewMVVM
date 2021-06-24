//
//  WebServices.swift
//  GoodNews
//
//  Created by Mostafa on 6/23/21.
//  Copyright © 2021 Mostafa Ashraf. All rights reserved.
//

import Foundation

class WebServices{
    func getArticales(url:URL , completion:@escaping ([Article]?) ->()) {
        
        URLSession.shared.dataTask(with: url) { data, response ,error in
            
            if let error =  error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
              let articlesList = try?  JSONDecoder().decode(ArticleList.self, from: data)
                if let articlesList = articlesList {
                    completion(articlesList.articles)
                }
                
                print(articlesList?.articles)
            }
            
            
        }.resume()
        
    }
}
