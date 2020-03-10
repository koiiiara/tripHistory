//
//  ViewController.swift
//  Place
//
//  Created by Илья Миронов on 30/07/2019.
//  Copyright © 2019 Ilya Mironov. All rights reserved.
//

import UIKit
import CoreData

class NewPlaceViewController: UIViewController {

    
    var currentExpense: Money! {
        didSet { expLabel.text = "\(String(currentExpense.amount)) \(currentExpense.currency!)"}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //currentExpense.amount = 0.0
        //currentExpense.currency = "RUB"
        // Do any additional setup after loading the view.
    }

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var rateStepper: UIStepper!
    @IBOutlet var expLabel: UILabel!
    @IBOutlet var latLonLabel: UILabel!
    @IBOutlet var transportSegmentControl: UISegmentedControl!
    @IBOutlet var descriptionLabel: UITextView!
    var lat: Double = 0
    var lon: Double = 0

    
    
    @IBAction func rateValueChanged(_ sender: UIStepper) {
    rateLabel.text = Int(sender.value).description
    }
    
    @IBAction func backFromExp(sender: UIStoryboardSegue){
        let amount = Double(((sender.source as? ExpViewController)?.amount.text)!) ?? 0
        let currency = ((sender.source as? ExpViewController)?.currency) ?? "RUB"
        currentExpense = createMoney(amount: amount, currency: currency)
    }
    
    @IBAction func backFromMap(sender: UIStoryboardSegue){
        lat = (sender.source as? MapViewController)!.lat
        lon = (sender.source as? MapViewController)!.lon
        latLonLabel.text = "lat:" + String(format: "%.4f", lat) + " lon:" + String(format: "%.4f", lon)
    }
    
    private func createMoney(amount: Double, currency: String) -> Money {
        let app = UIApplication.shared.delegate as? AppDelegate
        let context = (app?.coreDataStack.managedContext)!
        let money = Money(context: context)
        money.amount = amount
        money.currency = currency
        return money
    }
    
}

