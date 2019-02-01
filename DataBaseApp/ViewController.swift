//
//  ViewController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var results: [Result] = []
    var currentResult: Result?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getContent()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return results.count
    }
    
    //Builds the cell inside the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataViewCell
        {
            cell.load(results[indexPath.row])
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
        currentResult = results[indexPath.row]
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
    
    func getContent()
    {
        let jsonUrlString = "https://randomuser.me/api/?results=40&seed=raza"
        
        guard let url = URL(string: jsonUrlString) else
        {
            print("Unable to get the Json Data")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else
            {
                print("Data not available")
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
                print("Unable to get the data \n\n", jsonErr)
            }
            
        }.resume()
        
    }
}
