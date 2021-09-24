//
//  RMButton.swift
//  rickandmortyapi
//
//  Created by wahyujus on 24/09/21.
//

import UIKit

class RMButton: UIButton {

    override init(frame:CGRect){
        super.init(frame: frame)
        //custom code
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bgColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = bgColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
