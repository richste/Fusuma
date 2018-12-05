//
//  FSAlbumViewCell.swift
//  Fusuma
//
//  Created by Yuta Akizuki on 2015/11/14.
//  Copyright © 2015年 ytakzk. All rights reserved.
//

import UIKit
import Photos

final class FSAlbumViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberIndicator: UIView!
    @IBOutlet weak var numberIndicatorLabel: UILabel!
    
    var selectedLayer = CALayer()
    
    var image: UIImage? {
        
        didSet {
            
            self.imageView.image = image            
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.isSelected = false
        
        selectedLayer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5).cgColor
    }
    
    func setNumberIndicator(number: Int, maximum: Int) {
        hideNumberIndicator(false)
        numberIndicatorLabel.text = "\(number)/\(maximum)"
    }
    
    func hideNumberIndicator(_ hide: Bool) {
        numberIndicator.isHidden = hide
    }
    
    func setSelectedState(_ isSelected: Bool) {
        if selectedLayer.superlayer == self.imageView.layer {
            selectedLayer.removeFromSuperlayer()
            
        }
        numberIndicator.isHidden = !isSelected
        
        if isSelected {
            selectedLayer.frame = self.bounds
            self.imageView.layer.insertSublayer(selectedLayer, below: numberIndicator.layer)
        }
    }
    
    override var isSelected : Bool {
        
        didSet {
           // setSelectedState(isSelected)
        }
    }
    
}
