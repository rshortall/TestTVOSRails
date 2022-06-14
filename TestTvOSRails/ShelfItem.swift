//
//  ShelfItem.swift
//  TestTvOSRails
//
//  Created by Ronan Shortall on 12/06/2022.
//

import Foundation
import UIKit

class ShelfItem: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(background: UIColor, rowText: String, index: Int) {
        
        self.titleLabel.text = "\(rowText), Col: \(index)"
        
        self.backgroundColor = background
        
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        self.layer.borderWidth = (context.nextFocusedView == self) ? 8.0 : 0.0
    }
}
