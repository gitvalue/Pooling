//
//  ViewController.swift
//  demo
//
//  Created by Dmitry on 11/22/17.
//  Copyright © 2017 intervain. All rights reserved.
//

import UIKit

class PoolableLabel: UILabel, Poolable {
    required init<T>(pool: T) where T : Pooling {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PoolableLabel1: PoolableLabel {
    
}

class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var pool = Pool(size: 50, type: PoolableLabel1.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label: UILabel = pool.borrow()
    }
}

