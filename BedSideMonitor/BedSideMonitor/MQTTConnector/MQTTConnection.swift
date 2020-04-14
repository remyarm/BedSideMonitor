//
//  MQTTConnection.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 13/4/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

protocol MQTTConnection {
     func connect(result: Result<Bool>)
     func didReceiveMessage(values: String)
}

