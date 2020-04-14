//
//  MQTTConnector.swift
//  BedSideMonitor
//
//  Created by apple on 30/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftMQTT

protocol MQTTManager {
    func connected()
}

class MQTTConnector: MQTTSessionDelegate {

//    let  mqttSession = MQTTSession(
//        host: "broker.hivemq.com",
//        port: 1883,
//        clientID: "", // must be unique to the client
//        cleanSession: true,
//        keepAlive: 15,
//        useSSL: false
//    )
    
    let  mqttSession = MQTTSession(
        host: "hclquest.cloudapp.net",
        port: 1883,
        clientID: "mdpnp", // must be unique to the client
        cleanSession: true,
        keepAlive: 15,
        useSSL: false
    )
    
    func connectToServer() {
        mqttSession.connect { (error) in
            if (error == .none) {
                self.mqttSession.delegate = self
                self.mqttSession.subscribe(to: "devicedata", delivering: .atLeastOnce) { [weak self] (error) in
                    print("Sunscribed successfully")
                    self?.connect(result: Result.success(true))
                }
            }
        }
    }
    
    func mqttDidReceive(message: MQTTMessage, from session: MQTTSession) {
        print(message.topic)
        print(message.stringRepresentation ?? "")
        self.didReceiveMessage(data: message.payload)
        
    }
       
    func mqttDidAcknowledgePing(from session: MQTTSession) {
           
    }
       
    func mqttDidDisconnect(session: MQTTSession, error: MQTTSessionError) {
           
    }
}
