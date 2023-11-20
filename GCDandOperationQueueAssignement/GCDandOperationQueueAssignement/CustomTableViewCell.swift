//
//  CustomTableViewCell.swift
//  GCDandOperationQueueAssignement
//
//  Created by Tanish Parmar on 08/11/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seriesNameLabel: UILabel!
    @IBOutlet weak var playerMatchLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var seriesStatusLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
