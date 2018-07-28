//
//  CustomImageView.swift
//  NYTArticles
//
//  Created by Nitin on 28/07/18.
//  Copyright © 2018 Nitin. All rights reserved.
//

import UIKit

@IBDesignable
open class CustomImageView: UIImageView {
    @IBInspectable
    public var isCercular: Bool = false {
        didSet {
            if isCercular {
                self.layer.cornerRadius = self.bounds.width/2
                self.clipsToBounds = true
            }
        }
    }
//    override func draw(_ rect: CGRect) {
//        if isCercular {
//            self.layer.cornerRadius = self.bounds.width/2
//            self.clipsToBounds = true
//        }
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        
//    }
}
