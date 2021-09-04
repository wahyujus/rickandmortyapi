//
//  ViewController.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parser.parse()
    }


}

