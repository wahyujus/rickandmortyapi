//
//  ViewController.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()
    var characters = [Result]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parser.parse{
            data in
            self.characters = data
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
    }


}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        
        return cell
    }
    
    
}

