//
//  CommentCell.swift
//  CollectionViewDynamicSize
//
//  Created by Genusys Inc on 7/13/22.
//


import UIKit

struct Comment{
    let message:String
    let owner:String
    let ownerPhoto:String
    
}

class CommentCell: UICollectionViewCell {
    
    var  comment : Comment! {
        didSet {
            messageLab.text = comment.message
            nameLab.text = comment.owner
            img.image = UIImage(systemName: comment.ownerPhoto)
        }
    }
    
    var messageLab : UILabel = {
        let lab = UILabel()
        lab.text = ""
        lab.numberOfLines = 10
        lab.textColor = .white
        return lab
    }()
    
    var nameLab : UILabel = {
        let lab = UILabel()
        lab.text = "Mohannad bakbouk"
        lab.textColor = .white
        lab.numberOfLines = 1
        return lab
    }()
    
    var img : UIImageView = {
      let img = UIImageView()
      img.backgroundColor = .gray
      img.contentMode = .scaleAspectFill
      img.clipsToBounds = true
      //img.kf.indicatorType = .activity
      img.layer.cornerRadius = 25
      return img
    }()
    
    var container : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        //view.backgroundColor = .systemGray6
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews(){
        
        contentView.addSubview(img)
        contentView.addSubview(container)
        container.addSubview(nameLab)
        container.addSubview(messageLab)

        img.anchor(top: contentView.topAnchor, paddingTop: 5, bottom: nil, paddingBottom: 0, left: contentView.leadingAnchor, paddingLeft: 10, right: nil, paddingRight: 0, width: 50, height: 50)
        container.anchor(top: contentView.topAnchor, paddingTop: 0, bottom: contentView.bottomAnchor, paddingBottom: -10, left: img.trailingAnchor, paddingLeft: 10, right: contentView.trailingAnchor, paddingRight: -10, width: 0, height: 0)
        nameLab.anchor(top: container.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: container.leadingAnchor, paddingLeft: 10, right: container.trailingAnchor, paddingRight: -10, width: 0, height: 0)
        messageLab.anchor(top: nameLab.bottomAnchor, paddingTop: 10, bottom: container.bottomAnchor, paddingBottom: -5, left: container.leadingAnchor, paddingLeft: 10, right: container.trailingAnchor, paddingRight: -10, width: 0, height: 0)
        
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}
extension  UIView {
    
    func anchor(top : NSLayoutYAxisAnchor? , paddingTop : CGFloat ,
                bottom : NSLayoutYAxisAnchor? , paddingBottom : CGFloat ,
                left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        
        }
    }
}
