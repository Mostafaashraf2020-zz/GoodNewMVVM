//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mostafa on 6/23/21.
//  Copyright © 2021 Mostafa Ashraf. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articlesListVM:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
    
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-05-22&sortBy=publishedAt&apiKey=a9c45bc22ab446b4b1e43ff346c9ac6d")!
        WebServices().getArticales(url: url){ article in
            if let article = article{
                self.articlesListVM = ArticleListViewModel(articles: article)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }
            }
            
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlesListVM == nil ?  0:self.articlesListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesListVM == nil ?  0:self.articlesListVM.numberOfRowsInSection(section)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
                  fatalError("ArticleTableViewCell not found")
              }
              
              let articleVM = self.articlesListVM.articleAtIndex(indexPath.row)
              
              cell.titleLbl.text = articleVM.title
              cell.decLbl.text = articleVM.description
              return cell
    }
        
    }

