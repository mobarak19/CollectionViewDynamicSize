

import UIKit

class ViewController: UIViewController {

    @IBOutlet var commentCollection : UICollectionView!
    var data:[Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let commentFlowLayout = CommentFlowLayout()
        commentCollection.register(CommentCell.self, forCellWithReuseIdentifier: "cell")
        commentFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        commentFlowLayout.minimumInteritemSpacing = 10
        commentFlowLayout.minimumLineSpacing = 10
        commentCollection.collectionViewLayout = commentFlowLayout
        commentCollection.contentInsetAdjustmentBehavior = .always
        
        commentCollection.delegate = self
        commentCollection.dataSource = self
        
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, ", owner: "xyz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally compatible with all screen sizes and orientations, The constraints make sure our views will adjust to any size changes without having to manually update frames or positions.", owner: "zzz", ownerPhoto: "person"))
        data.append(Comment(message: "Auto layout allows us to create adaptive screens that are should be equally ", owner: "eeee", ownerPhoto: "person"))
        commentCollection.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"SecondVC") as! SecondVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CommentCell
        cell.comment = data[indexPath.row]
        return cell
    }
    
    
}

