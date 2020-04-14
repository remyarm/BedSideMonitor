//
//  GraphViewController.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 14/4/20.
//  Copyright © 2020 Murukesan, R. (Remya). All rights reserved.
//

import Foundation
import UIKit

class GraphViewController: UIViewController {
    
    @IBOutlet weak var leadIScrollView: UIScrollView!
    @IBOutlet weak var leadIIScrollView: UIScrollView!
    @IBOutlet weak var leadIIIScrollView: UIScrollView!
    
    @IBOutlet weak var graphI: GraphUI!
    
    @IBOutlet weak var graphII: GraphUI!
    
    @IBOutlet weak var graphIII: GraphUI!
    var viewModel = GraphViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.mqttConnector.connectionHandler = { [weak self]
            result in
            self?.connectionStatus(result: result)
        }
        viewModel.mqttConnector.receivedvalues = { [weak self] values in
            self?.valueReceived(value: values)
        }
        
        viewModel.connect()
    }
    
    func connectionStatus(result: Result<Bool>) -> Void {
        
    }
    
    func valueReceived(value: [Double]) {
        graphI.addValue(value: value[0])
        graphII.addValue(value: value[1])
        graphIII.addValue(value: value[2])
    }
}
