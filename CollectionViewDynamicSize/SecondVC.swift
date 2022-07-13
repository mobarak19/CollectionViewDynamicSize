//
//  SecondVC.swift
//  CollectionViewDynamicSize
//
//  Created by Genusys Inc on 7/13/22.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var photosCollection:UICollectionView!
    var photos:[Photo] = []
    var data:[Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        photos.append(Photo())
        photos.append(Photo())
        photos.append(Photo())
        photos.append(Photo())
        photos.append(Photo())
        photos.append(Photo())
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, ", owner: "xyz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally ", owner: "eeee", ownerPhoto: "person"))
        view.backgroundColor = .white
        
        photosCollection.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
          photosCollection.dataSource = self
          let layout = PinterestLayout()
          layout.delegate = self
          photosCollection.collectionViewLayout = layout
    }
    
    func calculateImageHeight (sourceImage : Photo, scaledToWidth: CGFloat) -> CGFloat {
            let oldWidth = CGFloat( sourceImage.width)
            let scaleFactor = scaledToWidth / oldWidth
            let newHeight = CGFloat(sourceImage.height) * scaleFactor
            return newHeight
        }
    func requiredHeight(text:String , cellWidth : CGFloat) -> CGFloat {
        let font = UIFont(name: "Helvetica", size: 16.0)
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height

    }
}
extension SecondVC:UICollectionViewDataSource,PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, cellWidth: CGFloat) -> CGFloat {
        let imgHeight = calculateImageHeight(sourceImage: photos[indexPath.row] , scaledToWidth: cellWidth)
            
        let textHeight = requiredHeight(text: data[indexPath.row].message, cellWidth: cellWidth)
            
            return (imgHeight + textHeight + 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
        cell.info = photos[indexPath.row]
        cell.descLab.text = data[indexPath.row].message
        return cell
    }
    
    
}
