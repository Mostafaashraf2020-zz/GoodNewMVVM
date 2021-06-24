//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Mostafa on 6/23/21.
//  Copyright © 2021 Mostafa Ashraf. All rights reserved.
//

import Foundation


struct ArticleListViewModel {
     let articles : [Article]
}

extension ArticleListViewModel{
    var numberOfSection : Int{
        
        return 1
    }
    
}


extension ArticleListViewModel{
    func numberOfRowsInSection(_ section :Int) -> Int{
        
        return self.articles.count
    }
    
}



extension ArticleListViewModel{
    func articleAtIndex(_ index :Int) -> ArticleViewModel{
        
        let article = self.articles[index]
        return ArticleViewModel(article)
        
    }
    
}




struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel{
    init(_ article: Article) {
        self.article  = article
    }
}

extension ArticleViewModel{
   
    var title : String{
        return self.article.title
    }
    
    var description:String {
        return self.article.description
    }
    
    
}
