import UIKit
import SnapKit
import FirebaseFirestore

class CatalogViewController: UIViewController {
    let snekers = Sneakers()
    let cart = Cart.shared
    
    let navBarTitle: UILabel = {
        let title = UILabel()
        title.text = "Hello, Sneakerhead!"
        title.font = .systemFont(ofSize: 17, weight: .medium)
        return title
    }()
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 174, height: 282)
        return layout
    }()
    
    var myCollectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = navBarTitle
        view.backgroundColor = .MyColors.GrayBG
//        changeRoot()
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(SneakerCollectionViewCell.self, forCellWithReuseIdentifier: SneakerCollectionViewCell.identifier)

        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.isUserInteractionEnabled = true
        view.addSubview(myCollectionView ?? UICollectionView())
        myCollectionView?.isUserInteractionEnabled = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        snekers.loadData {
            self.myCollectionView?.reloadData()
        }
    }
    
        func changeRoot() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let navigationController = UINavigationController(rootViewController: CatalogViewController())
            appDelegate.window?.rootViewController = navigationController
        }
    
    
}
    extension CatalogViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return snekers.sneakersArray.count// How many cells to display
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: SneakerCollectionViewCell.identifier, for: indexPath) as? SneakerCollectionViewCell else{ return UICollectionViewCell()}
            myCell.configure(snekers.sneakersArray[indexPath.row])
            return myCell
            
        }
        
        @objc func buttonDidTapped(sender: AnyObject) {
            print("button pressed")
            
//            guard let cell = sender.superview?.superview as? SneakerCollectionViewCell else {
//                return // or fatalError() or whatever
//            }
//            let indexPath = myCollectionView!.indexPath(for: cell)
//            
//            let pointInTable: CGPoint = sender.convert(sender.bounds!.origin, to: myCollectionView)
//            let cellIndexPath = self.myCollectionView?.indexPathForItem(at: pointInTable)
//            var point = cellIndexPath!.row
//            cart.addData(sneaker: self.snekers.sneakersArray[self.index.index])
        }
        
    }
    extension CatalogViewController: UICollectionViewDelegate {
     
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("User tapped on item \(indexPath.row)")
            cart.addData(sneaker: self.snekers.sneakersArray[indexPath.row])
        }
    }
