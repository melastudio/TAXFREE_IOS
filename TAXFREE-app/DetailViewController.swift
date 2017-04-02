//
//  DetailViewController.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 04.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit
import MaterialControls

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var nipfield: MDTextField!
    @IBOutlet weak var nazwaSprzedawcyfield: MDTextField!
    @IBOutlet weak var kodPocztowyfield: MDTextField!
    @IBOutlet weak var nrPaszportufield: MDTextField!
    @IBOutlet weak var nrDokumentufield: MDTextField!
    @IBOutlet weak var dataWystawieniafield: MDTextField!
    @IBOutlet weak var wartoscfield: MDTextField!
    @IBOutlet weak var walutafield: MDTextField!
    @IBOutlet weak var innyAsortymentfield: MDTextField!

    @IBOutlet weak var chbAGD: CheckBox!
    @IBOutlet weak var chbBudowlane: CheckBox!
    @IBOutlet weak var chbChemia: CheckBox!
    @IBOutlet weak var chbElektronarzedzia: CheckBox!
    @IBOutlet weak var chbElektronika: CheckBox!
    @IBOutlet weak var chbHigiena: CheckBox!
    @IBOutlet weak var chbKosmetyki: CheckBox!
    @IBOutlet weak var chbOdziez: CheckBox!
    @IBOutlet weak var chbOgrodnicze: CheckBox!
    @IBOutlet weak var chbRTV: CheckBox!
    @IBOutlet weak var chbSpozywcze: CheckBox!
    @IBOutlet weak var chbTekstylia: CheckBox!
    @IBOutlet weak var chbBizuteria: CheckBox!
    @IBOutlet weak var chbCzesciSam: CheckBox!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel { label.text = detail.description}
            self.initCheckboxes()
        }
    }
    
    
    func initCheckboxes(){
        if let button = self.chbAGD
        {
            button.setTitle("AGD", for: [])
            button.setValue(value: "AGD")
        }
        if let button = self.chbBudowlane
        {
            button.setTitle("Budowlane", for: [])
            button.setValue(value: "BUDOWLANE")
        }
        if let button = self.chbChemia
        {
            button.setTitle("Chemia", for: [])
            button.setValue(value: "CHEMIA")
        }
        if let button = self.chbElektronarzedzia
        {
            button.setTitle("Elektronarzędzia", for: [])
            button.setValue(value: "ELEKTRONARZĘDZIA")
        }
        if let button = self.chbElektronika
        {
            button.setTitle("Elektronika", for: [])
            button.setValue(value: "ELEKTRONIKA")
        }
        if let button = self.chbHigiena
        {
            button.setTitle("Higiena", for: [])
            button.setValue(value: "HIGIENA")
        }
        if let button = self.chbKosmetyki
        {
            button.setTitle("Kosmetyki", for: [])
            button.setValue(value: "KOSMETYKI")
        }
        if let button = self.chbOdziez
        {
            button.setTitle("Odzież", for: [])
            button.setValue(value: "ODZIEŻ")
        }
        if let button = self.chbOgrodnicze
        {
            button.setTitle("Ogrodnicze", for: [])
            button.setValue(value: "OGRODNICZE")
        }
        if let button = self.chbRTV
        {
            button.setTitle("RTV", for: [])
            button.setValue(value: "RTV")
        }
        if let button = self.chbSpozywcze
        {
            button.setTitle("Spożywcze", for: [])
            button.setValue(value: "SPOŻYWCZE")
        }
        if let button = self.chbTekstylia
        {
            button.setTitle("Tekstylia", for: [])
            button.setValue(value: "TEKSTYLIA")
        }
        if let button = self.chbBizuteria
        {
            button.setTitle("Biżuteria", for: [])
            button.setValue(value: "BIŻUTERIA")
        }
        if let button = self.chbCzesciSam
        {
            button.setTitle("Części samochodowe", for: [])
            button.setValue(value: "CZĘŚCI_SAMOCHODOWE")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    
}
