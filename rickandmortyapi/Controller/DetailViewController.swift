//
//  DetailViewController.swift
//  rickandmortyapi
//
//  Created by wahyujus on 09/09/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var img_view: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_gender: UILabel!
    @IBOutlet weak var label_location: UILabel!
    @IBOutlet weak var label_origin: UILabel!
    @IBOutlet weak var label_episode: UILabel!
    
    var img = UIImage()
    var name = ""
    var gender = ""
    var location = ""
    var origin = ""
    var episode = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        title = name
        img_view.image = img
        label_name.text = name
        label_gender.text = gender
        label_location.text = location
        label_origin.text = origin
        label_episode.numberOfLines = episode.count
        label_episode.textAlignment = NSTextAlignment.center
        label_episode.text = episode.joined(separator: "\n")
    }
    
    
    


}
