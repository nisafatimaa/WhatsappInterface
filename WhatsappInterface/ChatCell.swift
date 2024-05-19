//
//  ChatCell.swift
//  WhatsappInterface
//
//  Created by Macbook Pro on 21/01/2024.
//


import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet var name : UILabel!
    @IBOutlet var time : UILabel!
    @IBOutlet var message : UILabel!
    @IBOutlet var profileImage : UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String? ){
        super.init(style: style, reuseIdentifier: "ChatCell" )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
