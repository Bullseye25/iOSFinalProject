//
//  SearchController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 2/1/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

extension ViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func isFiltering() -> Bool
    {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool
    {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All")
    {
        filteredResults = results.filter({( res : Result) -> Bool in
            return /*Get by first name or last Name*/ (res.name?.first!.lowercased().contains(searchText.lowercased()))! || ((res.name?.last!.lowercased().contains(searchText.lowercased()))!)
        })
        
        tableView.reloadData()
    }
}
