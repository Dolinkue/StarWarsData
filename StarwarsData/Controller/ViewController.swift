//
//  ViewController.swift
//  StarwarsData
//
//  Created by Nicolas Dolinkue on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var starWarsTable: UITableView!
    
   
    var starwars: Starwarsinfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        starWarsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        starWarsTable.delegate = self
        starWarsTable.dataSource = self
        fecthData()
        
    }

    func fecthData() {
        
        Service.shared.fechData { data in
           self.starwars = data
        
        
        
        }
    }

}


extension ViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searBarText = searchBar.text else {return}
        
        
    }
    
    
}



// MARK: - UITableViewDelegate como interactuamos con las celdas
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fué seleccionada.")
    }
}

// MARK: - UITableViewDataSource los datos de las celdas
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starwars?.results.count ?? 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
    
        let star = starwars?.results[indexPath.row]
        let starName = star?.name
        
        
        cell.textLabel?.text = starName
        
        return cell
    }
}
