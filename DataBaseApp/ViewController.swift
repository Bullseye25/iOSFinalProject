//
//  ViewController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var results: [Result] = []
    var filteredResults = [Result]()
    var currentResult: Result?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getContent()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Data"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func getContent()
    {
        let jsonUrlString = "https://randomuser.me/api/?results=40&seed=raza"
        
        guard let url = URL(string: jsonUrlString) else
        {
            print("\n\n Unable to get the Json Data \n\n")
            self.displayMessage(message: "It Seems The Data Is Not Available")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else
            {
                print("\n\n Not Connected To Internet \n\n")
                self.displayMessage(message: "Please Check Your Internet Connection")
                return
            }
            
            do
            {
                let database = try JSONDecoder().decode(Database.self, from: data)
                
                for res in database.results!
                {
                     self.results.append(res)
                }
                
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }
            }
            catch let jsonErr
            {
                print("\n\n Unable to get the data \n\n", jsonErr)
                self.displayMessage(message: "Unable To Get The Data, Please Try to Reset The App")
            }
            
        }.resume()
        
        displayMessage(message: "Please Slide Down To Use The Search Bar")
    }
    
    func displayMessage(message: String)
    {
        let mes = UIAlertController(title: "Notification", message: message, preferredStyle: UIAlertController.Style.alert)
        mes.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(mes, animated: true, completion: nil)
    }
}
