//
//  StoreCollectionTableViewCell.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class StoreCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var item: StoreItem!
    
    /*
     backView: UIView!
     categoryLabel: UILabel!
     imgView: UIImageView!
     nameLabel: UILabel!
     priceLabel: UILabel!
     */
    
    static let identifier = "StoreCollectionTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "StoreCollectionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(StoreCollectionViewCell.nib(), forCellWithReuseIdentifier: StoreCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure (with indice: Int){
        self.item = Singleton.shared.storeItems?[indice]
        collectionView.reloadData()
//        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as! StoreCollectionViewCell
        if indexPath.row == 0 {
            cell.config(categoryLabel: item.category ?? "", activeLabel: true, imageView: "globoHome", nameLabel: item.items?[indexPath.row].title ?? "", priceLabel: item.items?[indexPath.row].price ?? 0.0)
            // imageView: item.items?[indexPath.row].image ?? ""
        } else {
            // este é "false" no active Label
            cell.config(categoryLabel: item.category ?? "", activeLabel: false, imageView:"globoHome", nameLabel: item.items?[0].title ?? "", priceLabel: item.items?[0].price ?? 0.0)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 190) // 190 / 230
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 40
//    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("CELULA CLICADA   \(indexPath.row)")
        
        /*
        if indexPath.row == 0 && fotoInicial{
            print("FOOOOOOI")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationFoto"), object: nil)
//            present(vc, animated: true)
//
        }
        
        */
        
    }
    
}
