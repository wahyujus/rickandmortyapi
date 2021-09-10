//
//  StrechHeaderViewController.swift
//  rickandmortyapi
//
//  Created by wahyujus on 10/09/21.
//

import UIKit

class StrechHeaderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let nav:UINavigationBar = {
        let nav = UINavigationController().navigationBar
        return nav
    }()
    
    var model = [String]()
    
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        let header = StrechHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = image
        tableView.tableHeaderView = header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
}
