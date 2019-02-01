//
//  TableController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 2/1/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isFiltering()
        {
            return filteredResults.count
        }
        
        return results.count
    }
    
    //Builds the cell inside the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataViewCell
        {
            if isFiltering()
            {
                cell.load(filteredResults[indexPath.row])
            }
            else
            {
                cell.load(results[indexPath.row])
            }
            cell.backgroundColor = cell.getColor(row: indexPath.row)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if isFiltering()
        {
            currentResult = filteredResults[indexPath.row]
        }
        else
        {
            currentResult = results[indexPath.row]
        }
        
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "detailSegue"
        {
            let detailViewController = segue.destination as? DetailsViewController
            
            detailViewController?.result = currentResult
        }
    }
    
}
