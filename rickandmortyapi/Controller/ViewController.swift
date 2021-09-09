//
//  ViewController.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import UIKit

class ViewController: UIViewController{
    
    var parser = Parser()
    private var viewModel = CharacterViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
        loadListData()
    }
    
    private func loadListData() {
        
        viewModel.fetchCharactersData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
        
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        let character = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(character)


        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController{
            
            let index = viewModel.characters[indexPath.row]
            
            //passing value to new screen
            vc.img = loadImage(uri: index.image)
            vc.name = index.name
            vc.gender = index.gender.rawValue
            vc.location = index.location.name
            vc.origin = index.origin.name
            vc.episode = index.episode
            
            //navigator
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func loadImage(uri: String)->UIImage{
        do {
            let url = URL(string:uri)!
            let data = try Data(contentsOf: url)
            return UIImage(data: data)!
        }
        catch{
            print(error)
            return UIImage(named: "noImageAvailable")!
        }
    }
}
