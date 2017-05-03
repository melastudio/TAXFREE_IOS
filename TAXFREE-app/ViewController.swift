//
//  ViewController.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 18.04.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit
import Material

class ViewController : UIViewController
{
    var seller = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"]
    var sellerName = ["Test1", "Test2", "Test3", "Test4","Test5","Test6","Test7","Test8"]
    //var meals = [Meal]()
    
    
    @IBOutlet weak var fabButton: FABButton!
    
    @IBOutlet weak var card: Card!
    @IBOutlet var tvSellers: UITableView?
    fileprivate var toolbar: Toolbar!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var showMenu = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        prepareFABButton()
        prepareToolbar()
        prepareCard()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview delegate
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return seller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        var cell : SampleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SampleTableViewCell
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?[0] as! SampleTableViewCell;
        }
        let stringTitle = sellerName[indexPath.row] as String //NOT NSString
        let strCarName = seller[indexPath.row] as String
        cell.LblTitle.text=stringTitle
        cell.lvPhoto.image = UIImage(named: strCarName)
        return cell as SampleTableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DetailSegue"
        {
            
            
            let detailViewController = ((segue.destination) as! UINavigationController)
           // let indexPath = self.tvSellers!.indexPathForSelectedRow!
            //let strImageName = seller[indexPath.row]
            //detailViewController.strImageName = strImageName
           // detailViewController.title = strImageName
           // detailViewController.navigationItem.title = "Pasta to One"
            //let addEventViewController = detailViewController as! DetailViewController
            
            //let indexPath = self.tvSellers!.indexPathForSelectedRow!
            //let strImageName = seller[indexPath.row]
            //detailViewController.strImageName = strImageName
            // detailViewController.title = strImageName
            detailViewController.navigationItem.title = "Pasta to One"
        }
    }
    
    @IBAction func unwindToRachunekList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? DetailViewController, let doktf = sourceViewController.doktf {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: seller.count, section: 0)
            
            sellerName.append((doktf as? String)!)
            //tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    func showSwipeMenu()
    {
        print("showSwipeMenu")
        trailingConstraint.constant=0
        leadingConstraint.constant=0
        showMenu = !showMenu
    }
}

extension ViewController {
    fileprivate func prepareFABButton() {
        let button = FABButton(image: Icon.cm.add, tintColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.yellow.base
        button.addTarget(self, action: #selector(handleFABButton(button:)), for: .touchUpInside)
        
        view.layout(button)
            .width(ButtonLayout.Fab.diameter)
            .height(ButtonLayout.Fab.diameter).bottomRight(bottom: 20, right: 20)
    }
    
    @objc fileprivate func handleFABButton(button: UIButton) {
        print("fabButtonClick")
    }
    
    fileprivate func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.title = "Ostatnio wprowadzone"
        toolbar.detail = "(posortowane według sprzedawcy)"
    }

    fileprivate func prepareCard() {
        card.toolbar = toolbar
        card.contentView = tvSellers
        view.layout(card).horizontally(left: 10, right: 10).center()
    }

}
