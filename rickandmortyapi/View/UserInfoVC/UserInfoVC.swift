//
//  UserInfoVC.swift
//  newrickandmorty
//
//  Created by wahyujus on 19/09/21.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    
    var id: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        layoutUI()
        getData()
    }
    
    func getData(){
        showLoadingView()
        NetworkManager.shared.getUserInfo(for: id) { [weak self] (result) in
            guard let self = self else { return }
            //cancel loading
            self.dismissLoadingView()
            
            switch(result){
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: UserInfoHeaderVC(user: user), to: self.headerView)
                }
                
            case .failure(let error):
                self.presentRMAlertOnMainThread(title: "something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    func layoutUI(){
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func add(childVC: UIViewController,to containerView:UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}
