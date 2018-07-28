//
//  ArticlesViewController.swift
//  NYTArticles
//
//  Created by Nitin on 28/07/18.
//  Copyright © 2018 Nitin. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

let BaseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=9cd9923ad54a4c508c5ae18d97238370"

class ArticlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    var articles = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchArticles()
    }
    
    func fetchArticles() {
        if let url = URL(string: BaseURL){
            Alamofire.request(url).responseArray(keyPath: "results"){
                (response: DataResponse<[Article]>) in
                 self.articles = response.result.value ?? [Article]()
                self.tblView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: tableview delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "ArticleCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ArticleCell
        cell.configure(withArticle: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}
