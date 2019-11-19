//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Адель Рахимов on 07/10/2019.
//  Copyright © 2019 Адель Рахимов. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class MainViewController: UITableViewController {
    
    var placesArray = [Places]()
    
    
    //var places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()


        tableView.reloadData()
    }

    
    
    
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
        
    }
    
    
    
    
}

extension MainViewController {
    func fetchData() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        do {
             placesArray = try managedContext.fetch(request) as! [Places]
            print("data fetched")
            
        } catch {
            print("fetch false: ", error.localizedDescription )

        }
    }
    
    func deleteData(indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(placesArray[indexPath.row])
        do {
            try managedContext.save()
            print("Data deleted")
            
        } catch {
            print("failed to delete", error.localizedDescription)
        }
    
        
        
        
    }
}


extension MainViewController {
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return placesArray.isEmpty ? 0 : placesArray.count
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = placesArray[indexPath.row]
        let im = place.image as! Data
        
        
        cell.nameLabel.text = place.name
        cell.typeLabel.text = place.type
        cell.locationLabel.text = place.location
        cell.imageOfPlace.image = UIImage(data: im)
        
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace .frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //let place = placesArray[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in

            self.deleteData(indexPath: indexPath)
            self.placesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
        
    }
    
    

    
}



