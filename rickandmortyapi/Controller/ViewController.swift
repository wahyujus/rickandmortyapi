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
        
        //Calling the instance of the navigation controller
        let nav = self.navigationController?.navigationBar
        nav?.prefersLargeTitles = true
        nav?.topItem?.title = "Rick and Morty API"
        
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
         let vc = StrechHeaderViewController()
            
        let index = viewModel.characters[indexPath.row]
        
        vc.image = loadImage(uri: index.image)
        vc.model.append("name: " + index.name)
        vc.model.append("gender: " + index.gender.rawValue)
        vc.model.append("location: " + index.location.name)
        vc.model.append("origin: " + index.origin.name)
        vc.model.append("Episodes:")
        vc.model.append(contentsOf: index.episode)
        self.navigationController?.present(vc, animated: true)
        
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
