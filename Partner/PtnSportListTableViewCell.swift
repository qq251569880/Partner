//
//  PtnSportListTableViewCell.swift
//  Partner
//
//  Created by 张宏台 on 15/12/7.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnSportListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var sportTitle: UILabel!
    @IBOutlet weak var sportCreator: UILabel!
    @IBOutlet weak var sportTime: UILabel!
    @IBOutlet weak var sportPlace: UILabel!
    @IBOutlet weak var sportParticipate: UILabel!
    @IBOutlet weak var sportIntoduce: UILabel!
    @IBOutlet weak var creatorImage: UIImageView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
