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
    let store = ForecastDataStore.sharedInstance
    
    lazy var forecastViewModel: ForecastViewModel =  {
        return ForecastViewModel(task: { [unowned self] in
            self.setupViews()
        })
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastViewModel.numberOfRowsFor(.day)
    }
    
    func setupViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.summaryLabel.text = self.forecastViewModel.currentSummary
            self.lowTempLabel.text = self.forecastViewModel.todayLowTemperature
            self.highTempLabel.text = self.forecastViewModel.todayHighTemperature
            self.currentTempLabel.text = self.forecastViewModel.currentTemperature
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = String(describing: forecastViewModel.tempFor(.day, at: indexPath.row))
        return cell
    }
    

   


}

