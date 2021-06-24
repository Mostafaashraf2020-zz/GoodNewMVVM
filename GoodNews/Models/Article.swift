//
//  Article.swift
//  GoodNews
//
//  Created by Mostafa on 6/23/21.
//  Copyright © 2021 Mostafa Ashraf. All rights reserved.
//

import Foundation

struct ArticleList : Decodable{
    let articles: [Article]
    
    
}




struct Article : Decodable{
    let title : String
    let description : String
    
    
}
