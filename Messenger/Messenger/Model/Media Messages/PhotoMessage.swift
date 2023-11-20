//
//  PhotoMessage.swift
//  Messenger
//
//  Created by Tanish Parmar on 17/10/23.
//

import Foundation
import MessageKit

class PhotoMessage: NSObject, MediaItem{
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
    
    init(path: String) {
        self.url = URL(fileURLWithPath: path)
        self.placeholderImage = UIImage(named: "photoPlaceholder")!
        self.size = CGSize(width: 240, height: 240)
    }
    
    
}
