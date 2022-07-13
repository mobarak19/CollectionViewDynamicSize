//
//  FeedCell.swift
//  CollectionViewDynamicSize
//
//  Created by Genusys Inc on 7/13/22.
//

import UIKit

class FeedCell: UICollectionViewCell {
   
    var img : UIImageView = {
      let img = UIImageView()
      img.backgroundColor = .gray
      img.contentMode = .scaleAspectFill
      img.clipsToBounds = true
      img.translatesAutoresizingMaskIntoConstraints = false
      img.setContentHuggingPriority(.defaultLow, for: .vertical)
      return img
    }()
    
    var descLab : UILabel = {
        let lab = UILabel()
        lab.textColor = .white
        lab.numberOfLines = 0
        lab.lineBreakMode = .byWordWrapping
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.font = UIFont(name: "Helvetica", size: 16)
        lab.setContentHuggingPriority(.defaultHigh, for: .vertical)
       return lab
    }()
    
    var info : Photo? {
        didSet {
            assignPhoto()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraints()
    }

    func setupConstraints(){
            img.anchor(top: contentView.topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: contentView.leadingAnchor, paddingLeft: 0, right: contentView.trailingAnchor, paddingRight: 0, width: 0, height: 0)
            descLab.anchor(top: img.bottomAnchor , paddingTop: 5, bottom: contentView.bottomAnchor, paddingBottom: -5, left: contentView.leadingAnchor, paddingLeft: 5, right: contentView.trailingAnchor, paddingRight: -5, width: 0, height: 0)
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        info = nil
        img.removeFromSuperview()
        descLab.removeFromSuperview()

    }
    
    deinit {
        info = nil
    }
    
    
    func setupViews(){
        layer.borderWidth = 1
        layer.borderColor =  UIColor.lightGray.cgColor
        backgroundColor = .systemTeal
        contentView.addSubview(img)
        contentView.addSubview(descLab)
    
    }
    
    func assignPhoto(){
//        
//        guard let data = info else {
//            return
//        }
        
        img.image = UIImage(named: "download")
    }
}
