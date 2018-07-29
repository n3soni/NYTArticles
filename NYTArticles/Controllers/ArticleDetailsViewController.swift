//
//  ArticleDetailsViewController.swift
//  NYTArticles
//
//  Created by Nitin on 29/07/18.
//  Copyright © 2018 Nitin. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ArticleDetailsViewController: UIViewController {

    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var lblImgCaption: UILabel!
    @IBOutlet weak var lblAstraction: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var svDetail: UIScrollView!
    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let imgCaptionStr = article?.media?[0].caption ?? ""
        let lblImgCapSize = imgCaptionStr.size(withAttributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 15)])
        let abstraction = article?.abstract ?? ""
        let lblAbstractionSize = abstraction.size(withAttributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)])
        svDetail.contentSize = CGSize(width: svDetail.bounds.width, height: lblImgCapSize.height + lblAbstractionSize.height)
        //setting data
        lblImgCaption.text = imgCaptionStr
        lblAstraction.text = abstraction
        lblTitle.text = article?.title ?? ""
        if let arrMetaDatas = article?.media?[0].mediaMetadata {
            let metaDatas = arrMetaDatas.filter({$0.format! == "Large"})
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
