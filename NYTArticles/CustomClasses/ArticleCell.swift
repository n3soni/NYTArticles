//
//  ArticleCell.swift
//  NYTArticles
//
//  Created by Nitin on 28/07/18.
//  Copyright © 2018 Nitin. All rights reserved.
//

import UIKit
import Alamofire

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
        if let arrMetaDatas = article.media?[0].mediaMetadata {
            let metaDatas = arrMetaDatas.filter({$0.format! == "Standard Thumbnail"})
            if metaDatas.count > 0 {
                if let fileUrlString = metaDatas.first?.url {
                    downloadAndSaveThumb(fileUrlString)
                }
            }
        }
    }
    
    func downloadAndSaveThumb(_ urlString: String) {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = urlString.components(separatedBy: "/").last
            let fileURL = documentsURL.appendingPathComponent(fileName!)

            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        Alamofire.download(urlString, to: destination).response { response in
            print(response)

            if let imagePath = response.destinationURL?.path {
                self.imgArticle.image = UIImage(contentsOfFile: imagePath)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
