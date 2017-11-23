//
//  ViewController.swift
//  demo
//
//  Created by Dmitry on 11/22/17.
//  Copyright © 2017 intervain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var pool = Pool(size: 50) {
        return UILabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label: UILabel = pool.borrow()
    }
}

