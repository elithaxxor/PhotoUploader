//
//  ViewCell.swift
//  PhotoPicker
//
//  Created by Adel Al-Aali on 1/30/23.
//

import Foundation
import UIKit


//  creates a simular
class PostTableViewCell : UITableViewCell {
    
    
    @IBOutlet var userImageView : UIImageView!
    @IBOutlet var postImageView : UIImageView!
    @IBOutlet var usernameLabel : UILabel!
    @IBOutlet var likesLabel : UILabel!
    
    static let identifier = "PostTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: InstagramPost ) {
        self.likesLabel.text = "\(model.numberOfLikes) likes"
        self.usernameLabel.text = model.username
        self.userImageView.image = UIImage(named: model.userImageName)
        self.postImageView.image = UIImage(named: model.postImageName)
        
    }
    
}



