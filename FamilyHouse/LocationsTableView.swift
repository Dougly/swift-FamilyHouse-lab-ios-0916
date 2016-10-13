//
//  LocationsTableView.swift
//  FamilyHouse
//
//  Created by Douglas Galante on 10/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var locations: [Location] = []
    
    @IBOutlet weak var addedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLocations()
        
    }
    
    func createLocations () {
        let location1 = Location(name: "Brooklyn", address: 1111, show: .familyMatters)
        let location2 = Location(name: "SanFrancisco", address: 222222, show: .fullHouse)
        
        locations.append(location1)
        locations.append(location2)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addedTableView.dequeueReusableCell(withIdentifier: "customRow", for: indexPath) as! LocationsTableViewCustomCell
        
        cell.addressLabel.text = String(locations[indexPath.row].address)
        cell.nameLabel.text = String(locations[indexPath.row].name)
        cell.showLabel.text = locations[indexPath.row].show.showAsString
        
        
        
        return cell
    }
}


class LocationsTableViewCustomCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var showLabel: UILabel!
    
    
}
