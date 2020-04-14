//
//  ViewController.swift
//  BedSideMonitor
//
//  Created by Murukesan, R. (Remya) on 13/4/20.
//  Copyright © 2020 Murukesan, R. (Remya). All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuList: UITableView!
    var viewmodel = DashBoardViewModel()
    var menuToggle = false
    override func viewDidLoad() {
        super.viewDidLoad()
       // menuList.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        // Do any additional setup after loading the view, typically from a nib.
        toggleMenu()
        menuList.backgroundColor = UIColor.clear
    }
    func toggleMenu() {
        if self.menuToggle {
            self.menuLeadingConstraint.constant = self.view.frame.size.width * -1
            self.menuToggle = false
        } else {
            self.menuLeadingConstraint.constant = 0
            self.menuToggle = true
        }
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @IBAction func menuButtonTapped(_ sender: Any) {
        toggleMenu()
    }
}

extension DashBoardVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.deviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell
        guard let tableCell = cell else { return UITableViewCell() }
        tableCell.backgroundColor = UIColor.clear
        tableCell.loadData(value: viewmodel.deviceList[indexPath.row])
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewmodel.deviceList[indexPath.row] {
        case MenuList.home.rawValue:
            
            break
        case MenuList.ecg.rawValue: break
            
        default:
            break
            
        }
    }
}
