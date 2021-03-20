//
//  DetailsViewController.swift
//  AppleHistory
//
//  Created by Mac on 21.02.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var image: UIImage?
    var label = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = image
        detailLabel.text = label
    }

}
