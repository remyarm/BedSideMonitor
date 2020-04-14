//
//  DashBoardViewModel.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 14/4/20.
//  Copyright © 2020 Murukesan, R. (Remya). All rights reserved.
//

import Foundation

enum MenuList: String, CaseIterable {
    case home = "Home"
    case ecg  = "ECG"
    
    static func menuList() -> [String] {
        let allValues = MenuList.allCases.map { $0.rawValue }
        return allValues
    }
}

struct DashBoardViewModel
{
    let deviceList = MenuList.menuList()
}
