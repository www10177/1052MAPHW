//
//  ViewController.swift
//  AirportList
//
//  Created by Yen-Kuei Huang on 30/05/2017.
//  Copyright © 2017 Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var name : String?
    var country : String?
    var city : String?
    var IATA : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nameL = self.view.viewWithTag(100) as! UILabel
        let countryL = self.view.viewWithTag(101) as! UILabel
        let cityL = self.view.viewWithTag(102) as! UILabel
        let img = self.view.viewWithTag(103) as! UIImageView
        nameL.text = name!
        countryL.text = "Country : " + country!
        cityL.text = "City : " + city!
        self.title = IATA!
        img.image = UIImage(named: "Airports Data/"+IATA!+".jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
