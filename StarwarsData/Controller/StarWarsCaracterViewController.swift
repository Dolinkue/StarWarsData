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

        nameLabel.text = "Name: " + star!.name
        hairColor.text = "Hair color: " + star!.hair_color
        gender.text = "Gender: " + star!.gender
        mass.text = star?.mass
        
        if nameLabel.text == "Name: Darth Vader" {
            imageCaracter.image = UIImage(named: "darthvader")

        }
        
    }
    


}
