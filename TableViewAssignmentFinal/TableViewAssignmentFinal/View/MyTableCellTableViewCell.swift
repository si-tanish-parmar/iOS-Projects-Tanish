//
//  MyTableCellTableViewCell.swift
//  TableViewAssignmentFinal
//
//  Created by Tanish Parmar on 11/10/23.
//

import UIKit

class MyTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
