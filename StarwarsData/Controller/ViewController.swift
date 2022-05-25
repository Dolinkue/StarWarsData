//
//  ViewController.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {

    
    var fetchedCaracter = Starwarsinfo(results: [Results]())
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var starWarsTable: UITableView!
    
   
    var starwars = Starwarsinfo(results: [Results]()){
        didSet{
            starWarsTable.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        starWarsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        starWarsTable.delegate = self
        starWarsTable.dataSource = self
        fecthData()
        self.starWarsTable.tableHeaderView = searchBar
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["1", "2"]
    }

    func fecthData() {
        
        Service.shared.fechData { data in
           self.starwars = data
            
            
        
        }
    }
    
    
    
    

}


extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            fecthData()
        } else {
            
                starwars.results = starwars.results.filter({ Results in
                    return Results.name.contains(searchText)
                })
            
            
            
            
            
        }
        
        self.starWarsTable.reloadData()
    }
    
    
}





// MARK: - UITableViewDelegate como interactuamos con las celdas
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showdata", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StarWarsCaracterViewController {
            destination.star = starwars.results[starWarsTable.indexPathForSelectedRow!.row]
        }
    }
    
    
}



// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starwars.results.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        cell.textLabel?.text = self.starwars.results[indexPath.row].name
        
        
        return cell
    }
}
