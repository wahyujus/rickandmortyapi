//
//  CustomTableViewCell.swift
//  rickandmortyapi
//
//  Created by wahyujus on 04/09/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_species: UILabel!
    @IBOutlet weak var label_status: UILabel!
    
    private var urlString: String = ""
    
    // Setup Characters values
    func setCellWithValuesOf(_ characters:Result) {
        updateUI(name: characters.name, species: characters.species.rawValue, status: characters.status.rawValue, image: characters.image)
    }
    
    private func updateUI(name: String?, species: String?, status: String?, image: String?) {
        
        self.label_name.text = name
        self.label_species.text = customSpecies(species: species)
        self.label_status.text = customStatus(status: status)
        
        guard let posterString = image else {return}
        urlString = posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.img.image = UIImage(named: "noImageAvailable")
            return
        }
        
        // Before we download the image we clear out the old one
        // fixed lag on scrolling
        self.img.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    
    private func customSpecies(species: String?) -> String {
        let custSpecies = species!.lowercased() != "human" ? "👽 " + species! : "😳 " + species!
        return custSpecies
    }
    
    private func customStatus(status: String?) -> String {
        let custStatus = status!.lowercased() == "alive" ? "✝️ " + status! : status!.lowercased() == "dead" ? "🪦 " + status! : "⁇ " + status!
        return custStatus
    }
    
    // MARK: - Get image data
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.img.image = image
                    self.img?.layer.cornerRadius = self.img.frame.height/2
                    self.img?.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                    self.img?.layer.borderWidth = 1.0
                }
            }
        }.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
