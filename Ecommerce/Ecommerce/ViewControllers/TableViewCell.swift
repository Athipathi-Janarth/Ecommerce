//
//  TableViewCell.swift
//  ECommerce
//
//  Created by AthiPathi on 3/16/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ID: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var ProductType: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var OrderDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
