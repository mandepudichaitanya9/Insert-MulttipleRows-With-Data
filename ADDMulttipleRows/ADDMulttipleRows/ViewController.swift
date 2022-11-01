//
//  ViewController.swift
//  ADDMulttipleRows
//
//  Created by chaitanya on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var carNames = ["Merc","Volvo","Audi","Toyota"]

    @IBOutlet weak var carDetailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func alertPopUpDisplayed(){
        let alert = UIAlertController(title: "Welcome", message: "Enter Your Car Company Name", preferredStyle: .alert)
        alert.addTextField { fields in
            fields.placeholder = "Enter Your Car Company Name"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            guard let field = alert.textFields else {return}
            let textField = field[0]
            if let carData = textField.text {
            self.carNames.insert(carData, at: 0)
            self.carDetailsTableView.reloadData()
            }
                    
            
        }))
        present(alert, animated: true, completion: nil)
        
    }

    @IBAction func BtnTapped(_ sender: Any) {
        alertPopUpDisplayed()
    }
    
}



extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = carNames[indexPath.row]
        return cell!
    }
    
}
