//
//  MenuCell.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 14/4/20.
//  Copyright © 2020 Murukesan, R. (Remya). All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    static let identifier = "MenuCell"
    
    @IBOutlet weak var menuLabel: UILabel!
    func loadData(value: String) {
        menuLabel.text = value
    }
}
