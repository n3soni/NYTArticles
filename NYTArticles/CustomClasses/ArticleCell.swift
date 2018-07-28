//
//  ArticleCell.swift
//  NYTArticles
//
//  Created by Nitin on 28/07/18.
//  Copyright © 2018 Nitin. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var imgArticle: CustomImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblByLine: UILabel!
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withArticle article: Article) {
        imgArticle.backgroundColor = UIColor.darkGray
        lblArticleTitle.text = article.title ?? ""
        lblByLine.text = article.byline ?? ""
        lblSource.text = article.source ?? ""
        lblPublishDate.text = article.publishedDate ?? ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
