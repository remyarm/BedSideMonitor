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
        navigationItem.title = "ECG Monitor"
        navigationItem.backBarButtonItem?.title = ""
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
        
        if (graphI.currentRect.x > leadIScrollView.frame.width) {
            UIView.animate(withDuration: 0.3) {
                self.leadIScrollView.scrollRectToVisible(CGRect(x: self.graphI.currentRect.x, y: self.graphI.currentRect.y, width: 50, height: 50), animated: false)
            }
        }
        
        if (graphII.currentRect.x > leadIIScrollView.frame.width) {
            UIView.animate(withDuration: 0.3) {
                self.leadIIScrollView.scrollRectToVisible(CGRect(x: self.graphII.currentRect.x, y: self.graphII.currentRect.y, width: 50, height: 50), animated: false)
            }
        }
        
        if (graphIII.currentRect.x > leadIIIScrollView.frame.width) {
            UIView.animate(withDuration: 0.3) {
                self.leadIIIScrollView.scrollRectToVisible(CGRect(x: self.graphIII.currentRect.x, y: self.graphIII.currentRect.y, width: 50, height: 50), animated: false)
            }
        }
    }
}
