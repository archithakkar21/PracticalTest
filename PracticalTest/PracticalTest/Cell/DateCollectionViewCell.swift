//
//  DateCollectionViewCell.swift
//  PracticalTest
//
//  Created by Archi Thakkar on 29/09/21.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variables-
    var didChangeDate : ((UITableViewCell) -> Void)?
    
    //MARK: - IBOutlet-
    @IBOutlet weak var btnDate: UIButton!
    
    //MARK: - IBActions-
    @IBAction func didTapOnDate(_ sender: UIButton) {
        
    }
}
