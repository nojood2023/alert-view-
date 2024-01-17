//
//  todosCell.swift
//  taskManagement
//
//  Created by Nojood Aljuaid  on 02/07/1445 AH.
//

import UIKit

class todosCell: UITableViewCell {

    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var todoLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
