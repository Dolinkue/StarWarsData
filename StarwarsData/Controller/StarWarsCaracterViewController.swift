//
//  StarWarsCaracterViewController.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 24/05/2022.
//

import UIKit

class StarWarsCaracterViewController: UIViewController {
    
    
    @IBOutlet weak var imageCaracter: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var hairColor: UILabel!
    
    
    @IBOutlet weak var mass: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    
    var star: Results?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        nameLabel.text = "Name: " + star!.name
        hairColor.text = "Hair color: " + star!.hair_color
        gender.text = "Gender: " + star!.gender
        mass.text = star?.mass
        
        
        switch nameLabel.text {
            case "Name: Darth Vader" :
                imageCaracter.image = UIImage(named: "darthvader")
            case "Name: Luke Skywalker" :
                imageCaracter.image = UIImage(named: "luke")
            case "Name: C-3PO" :
                imageCaracter.image = UIImage(named: "c-3po")
            case "Name: R2-D2" :
                imageCaracter.image = UIImage(named: "r2d2")
            default:
                print("no hay imagen")
            
        }
        
        
        
    }
    @objc func shareTapped() {
        guard let image = imageCaracter.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    


}
