//
//  AirportTableViewController.swift
//  AirportList
//
//  Created by Yen-Kuei Huang on 30/05/2017.
//  Copyright © 2017 Rist. All rights reserved.
//

import UIKit




class AirportTableViewController: UITableViewController {

    var airportData = [[String:String]]() // all raw in data
    var countries = [String]() // all countries array
    var airport = [String:[String]]() // Country : IATA
    //var shortName = [String:String]() // IATA : ShortName
    var IATAtoCountries = [String:String]() // IATA : Country
    var fullName = [String:String]() // IATA : Airport
    var cities = [String:String]() // IATA : ServedCity
    
    // MARK : My functions
    private func loadData(){
        if let filePath = Bundle.main.path(forResource: "Airports Data/airports", ofType: "plist"){
            airportData = NSArray(contentsOfFile: filePath) as! [[String:String]]
        }
        var duplicatedCountry = [String]()
        for dict in airportData{
            duplicatedCountry.append(dict["Country"]!)
      //      shortName[dict["IATA"]!] = dict["ShortName"]!
            fullName[dict["IATA"]!] = dict["Airport"]!
            cities[dict["IATA"]!] = dict["ServedCity"]!
            IATAtoCountries[dict["IATA"]!] = dict["Country"]!
        }
        countries = Array(Set(duplicatedCountry))
        
        for country in countries{
            var airportlist = [String]()
            for dict in airportData{
                if dict["Country"]! == country{
                    airportlist.append(dict["IATA"]!)
                }
            }
            airport[country] = airportlist
        }
        countries.sort()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let country = countries[section]
        return airport[country]!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countries[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "AirportCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let country = countries[indexPath.section]
        let name = airport[country]![indexPath.row]
        let content = cell.contentView
        if let title = content.viewWithTag(1) as? UILabel,
            let subtitle = content.viewWithTag(2) as? UILabel,
            let detail = content.viewWithTag(3) as? UILabel{
            title.text = fullName[name]
            subtitle.text = name
            detail.text = cities[name]
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show" {
            guard let cell = sender as? UITableViewCell else{
                fatalError("Sender is not a UITableViewCell")
            }
            let dest = segue.destination as! ViewController
            let IATA = (cell.contentView.viewWithTag(2) as! UILabel).text
            dest.IATA = IATA
            dest.name = fullName[IATA!]
            dest.country = IATAtoCountries[IATA!]
            dest.city = cities[IATA!]
            
            
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
