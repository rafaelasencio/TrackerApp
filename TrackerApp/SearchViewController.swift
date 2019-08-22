//
//  ViewController.swift
//  TrackerApp
//
//  Created by Rafael on 22/08/2019.
//  Copyright © 2019 RafaelAB. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    //MARK:- IBOulets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var searchResults = [SearchResult]()
    var hasSearched = false
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0) //Fix area covered by the search bar
    }

}

//MARK:- Extensions

//Search bar delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() //Dismissing keyboard on search
        searchResults = []
        if searchBar.text != "justin" {
            for i in 0...2 {
                let searchResult = SearchResult()
                searchResult.name = String(format: "Fake Result %d for '%@'", i)
                searchResult.artistName = searchBar.text!
                searchResults.append(searchResult)
            }
        }
        hasSearched = true
        tableView.reloadData()
    }
    //Extending search bar to status area
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

//Table view delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0 //Handling no results when app starts
        } else if searchResults.count == 0 {
            return 1 //Show No results Cell
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        if searchResults.count == 0 { //Handling no results
            cell.textLabel!.text = "(Nothing found)"
            cell.detailTextLabel!.text = ""
        } else {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel!.text = searchResult.name
            cell.detailTextLabel!.text = searchResult.artistName
        }
        return cell
    }
        //Selection handling
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}
