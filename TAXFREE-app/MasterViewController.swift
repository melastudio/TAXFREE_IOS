//
//  MasterViewController.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 04.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import UIKit
import Material

/*class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem

        //let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //self.navigationItem.rightBarButtonItem = addButton

        
        //if let split = self.splitViewController {
         //   let controllers = split.viewControllers
            //self.detailViewController = (self.childViewControllers[0] as! UINavigationController).topViewController as? DetailViewController
        //}
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

class MasterViewController: UIViewController {
    
    var detailViewController: DetailViewController? = nil
    /**
     Retrieves the data source items for the tableView.
     - Returns: An Array of DataSourceItem objects.
     */
    open var dataSourceItems = [DataSourceItem]()
    
    fileprivate var toolbar: Toolbar!
    fileprivate var tableView: TableView!
    fileprivate var card: Card!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        view.backgroundColor = .white
        prepareToolbar()
        prepareTableView()
        prepareCard()
        prepareData()
    }
}

extension MasterViewController: TableViewDelegate {
    fileprivate func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.title = "Ostatnio wprowadzone"
        //toolbar.detail = "Sample"
    }
    
    fileprivate func prepareTableView() {
        tableView = TableView()
        tableView.height = 400
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "showDetail")
    }
    
    fileprivate func prepareCard() {
        card = Card()
        card.toolbar = toolbar
        card.contentView = tableView
        view.layout(card).horizontally(left: 10, right: 10).center()
    }
    
    fileprivate func prepareData() {
        let persons = [["name": "Test1"], ["name": "Test2"]]
        for person in persons {
            dataSourceItems.append(DataSourceItem(data: person))
        }
        tableView.reloadData()
    }
    
    @objc fileprivate func insertNewObject(_ sender: Any) {
        //objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    @objc
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
        if segue.identifier == "showDetail" {
                    }
    }

}

extension MasterViewController: TableViewDataSource { //ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
    @objc
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @objc
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    @objc
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showDetail", for: indexPath) as! TableViewCell
        
        guard let data = dataSourceItems[indexPath.row].data as? [String: String] else {
            return cell
        }
        
        cell.textLabel?.text = data["name"]
        
        return cell
    }
    
    
}*/

 




