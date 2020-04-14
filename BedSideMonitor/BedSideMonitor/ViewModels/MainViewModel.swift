//
//  MainViewModel.swift
//  BedSideMonitor
//
//  Created by apple on 04/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import Combine

enum MenuTypes: String, CaseIterable {
    case none = "None"
    case ECG = "ECG"
    case Device1 = "Device1"
    
    func allMenuTypes() -> [String] {
        var values = [String]()
        for menu in MenuTypes.allCases {
            values.append(menu.rawValue)
        }
        return values
    }
}

class MainViewModel: ObservableObject {
    @Published var currentMenu = MenuTypes.none
    @Published var menuToggle = false
    @Published var currentValue = 0.0
    var mqttCancellable: AnyCancellable?
    let mqttConnector = MQTTConnector()
    init() {
        connect()
    }
    
    func connect() {
      mqttCancellable =  self.mqttConnector.mqttPublisher.sink(receiveCompletion: { (_) in
            print("Done")
        }) { (value) in
            self.currentValue = value
        }
//        self.mqttConnector.connectionPublisher.sink(receiveCompletion: {_ in
//
//        }) { (value) in
//            if (value) {
//
//            }
//        }
        mqttConnector.connectToServer()
    }
    
    
}

