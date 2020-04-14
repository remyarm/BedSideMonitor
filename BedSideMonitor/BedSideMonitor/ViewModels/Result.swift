//
//  Result.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 13/4/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case error(Error)
}
