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
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                
            }
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

    /*@IBAction func btn_box(sender: UIButton) {
        if (btn_box.selected == true)
        {
            btn_box.setBackgroundImage(UIImage(named: "box"), forState: UIControlState.Normal)
            btn_box.selected = false;
        }
        else
        {
            btn_box.setBackgroundImage(UIImage(named: "checkBox"), forState: UIControlState.Normal)
            btn_box.selected = true;
        }
    }*/
}

//\d{4}-\d{2}-\d{2} data
