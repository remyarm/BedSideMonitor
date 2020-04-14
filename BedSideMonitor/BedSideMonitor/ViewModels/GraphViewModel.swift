//
//  graphViewModel.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 14/4/20.
//  Copyright © 2020 Murukesan, R. (Remya). All rights reserved.
//

import Foundation

struct GraphViewModel {
    
    var mqttConnector = MQTTConnector()
    
    func connect() -> Void {
        mqttConnector.connectToServer()
    }
}
