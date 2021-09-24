//
//  DashboardVC.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

class DashboardVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, CharacterResult>!
    
    var characters: [CharacterResult] = []
    var filterCharacters: [CharacterResult] = []
    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollectionView()
        configureSearchController()
        getCharactersAPI()
        configureDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: DashboardController.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(DashboardCell.self, forCellWithReuseIdentifier: DashboardCell.reuserID)
    }
    
    func getCharactersAPI(){
        showLoadingView()
        NetworkManager.shared.getCharacters { [weak self] (result) in
            
            //save from memory leak
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch(result){
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                
                //show empty state
                if self.characters.isEmpty {
                    let message = "characters is empty"
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message, in: self.view)
                    }
                    return
                }
                
                self.updateData(on: self.characters)
                
            case .failure(let error):
                print("\(error)")
                self.presentRMAlertOnMainThread(title: "bad stuff happend", message: error.rawValue, buttonTitle: "alright")
            }
        }
    }
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, CharacterResult>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, character) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCell.reuserID, for: indexPath) as! DashboardCell
            
            cell.set(character: character)
            
            return cell
        })
    }
    
    func updateData(on followers: [CharacterResult]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, CharacterResult>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    //search
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "search characters"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

}

extension DashboardVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filterCharacters : characters
        let character = activeArray[indexPath.item]

        let destVC = UserInfoVC()
        destVC.id = "\(character.id)"
        let navigationController = UINavigationController(rootViewController: destVC)

        present(navigationController, animated: true)
    }
}

extension DashboardVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        filterCharacters = characters.filter{ $0.name.lowercased().contains(filter.lowercased()) }
        updateData(on: filterCharacters)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: characters)
    }
}
