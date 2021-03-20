

import UIKit

class ImageViewController: UITableViewController {
    
    private let data = ["Присед", "Жим"]
    private var filteredProgramText: [String] = []
    private var filteredImages: [String] = []
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredProgramText.count
        }
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImagesTableViewCell
        
        var program = data[indexPath.row]
        var image = data[indexPath.row]
        
        if isFiltering {
            program = filteredProgramText[indexPath.row]
            image = filteredImages[indexPath.row]
        } else {
            program = data[indexPath.row]
            image = data[indexPath.row]
        }
        
        cell.imagesView.image = UIImage(named: image)
        cell.nameLabel.text = program
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            let photoVC = segue.destination as! DetailsViewController
            let cell = sender as! ImagesTableViewCell
            photoVC.image = cell.imagesView.image
            photoVC.label = cell.nameLabel.text ?? ""
        }
    }
}



extension ImageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredProgramText = data.filter({ (program) -> Bool in
            return program.lowercased().contains(searchText.lowercased())
        })
        
        filteredImages = data.filter({ (images) -> Bool in
            return images.lowercased().contains(searchText.lowercased())
        })
        
        
        tableView.reloadData()
    }
    
}
