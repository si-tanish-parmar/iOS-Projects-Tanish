//
//  MyCollectionViewCell.swift
//  CollectionViewInTableViewFinal
//
//  Created by Tanish Parmar on 02/11/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with models: DogModel){
        self.myLabel.text = models.text
        if let imageUrl = URL(string: models.imageUrl) {
            URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.myImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
