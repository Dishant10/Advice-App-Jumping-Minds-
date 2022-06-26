//
//  ViewController.swift
//  Advice App(JumpingMinds-Assessment)
//
//  Created by Dishant Nagpal on 25/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var randomButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var parser = Parser()
    var advices = [Advice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        parser.performRequest { data  in
            self.advices = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
}



///MARK:- Table View

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advices.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = advices[indexPath.row].advice
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
    
    
    
}
