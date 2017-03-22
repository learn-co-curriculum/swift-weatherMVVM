//
//  ViewController.swift
//  WeatherMVVM
//
//  Created by Johann Kerr on 3/9/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
 
    
    lazy var forecastViewModel: ForecastViewModel =  {
        return ForecastViewModel(task: { [unowned self] in
            self.setupViews()
        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func setupViews() {
        
        self.tableView.reloadData()
        self.summaryLabel.text = ""
        self.lowTempLabel.text = ""
        self.highTempLabel.text = ""
        self.currentTempLabel.text = ""
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = ""
        return cell
    }
    

   


}

