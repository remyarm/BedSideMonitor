//
//  MQTTConnector_Extension.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 13/4/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

extension MQTTConnector: MQTTConnection {
    
    func connect(result: Result<Bool>) {
        guard let handler = connectionHandler else {return}
        handler(result)
    }
    
    func didReceiveMessage(values: String) {
        guard let messageHandler = receivedvalues else {return}
        let leadArray = values.split(separator: ",")
        print("Lead Array" , leadArray)
        let valueArray = leadArray.map { (value) -> Double in
            let array = value.split(separator: "#")
            guard let secondValue = array.last , let dobleValue = Double(secondValue) else { return 0.0}
            return dobleValue
        }
        messageHandler(valueArray)
    }
    
    
}
