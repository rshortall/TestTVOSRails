//
//  ViewController.swift
//  TestTvOSRails
//
//  Created by Ronan Shortall on 12/06/2022.
//

import UIKit

class ShelfModel {
    
    var backgroundColor = UIColor.clear
    
    var lastFocusedIndex: Int?
    
    init(background: UIColor) {
        
        self.backgroundColor = background
    }
}

class ViewController: UIViewController {
    
    let shelves: [ShelfModel] = [
        
        ShelfModel(background: .orange),
        ShelfModel(background: .yellow),
        ShelfModel(background: .purple),
        ShelfModel(background: .green),
        ShelfModel(background: .blue),
        ShelfModel(background: .gray)
    ]
    
    @IBOutlet weak var shelvesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        shelvesCollectionView.dataSource = self
        shelvesCollectionView.delegate = self
        
        initShelves()
    }
    
    private func initShelves() {
        
        shelvesCollectionView.register(UINib(nibName: "Shelf", bundle: nil), forCellWithReuseIdentifier: "ShelfIdentifier")
        
        if let flowLayout = shelvesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowLayout.scrollDirection = .vertical
            flowLayout.itemSize = CGSize(width: self.view.bounds.width, height: 300.0)
            flowLayout.minimumInteritemSpacing = 20.0
            flowLayout.minimumLineSpacing = 40.0
            flowLayout.sectionInset = UIEdgeInsets(top: 20.0,
                                                   left: 20.0,
                                                   bottom: 20.0,
                                                   right: 20.0)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shelves.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShelfIdentifier", for: indexPath) as? Shelf {
            
            cell.configure(with: shelves[indexPath.row], row: indexPath.row)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.size.width - 20, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        
        // Needs to be set to false or the whole shelf will be focused
        return false
    }
}
