//
//  Shelf.swift
//  TestTvOSRails
//
//  Created by Ronan Shortall on 12/06/2022.
//

import Foundation
import UIKit

class Shelf: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shelfItemsCollectionView: UICollectionView!
    
    var data: ShelfModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shelfItemsCollectionView.register(UINib(nibName: "ShelfItem", bundle: nil), forCellWithReuseIdentifier: "ShelfItemIdentifier")
        
        shelfItemsCollectionView.remembersLastFocusedIndexPath = true
        
        if let flowLayout = shelfItemsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 400.0, height: self.bounds.height - 40)
            flowLayout.minimumInteritemSpacing = 80.0
            flowLayout.minimumLineSpacing = 80.0
            flowLayout.sectionInset = UIEdgeInsets(top: 0.0,
                                                   left: 0.0,
                                                   bottom: 0.0,
                                                   right: 0.0)
        }
    }
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        
        return super.preferredFocusEnvironments
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(with shelfData: ShelfModel, row: Int) {
        
        self.data = shelfData
        
        self.titleLabel.text = "Row \(row)"
        
        shelfItemsCollectionView.dataSource = self
        shelfItemsCollectionView.delegate = self
    }
}

extension Shelf: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let bg = self.data?.backgroundColor {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShelfItemIdentifier", for: indexPath) as? ShelfItem {
                
                cell.configure(background: bg, rowText: self.titleLabel.text ?? "", index: indexPath.row)
                
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
}

extension Shelf: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        CGSize(width: 400.0, height: self.bounds.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {

        return IndexPath(row: 0, section: 0)
    }
}
