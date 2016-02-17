//
//  AnimalsViewController.swift
//  PopoverSample
//
//  Created by Jeffrey Ondich on 2/16/16.
//  Copyright © 2016 Jeff Ondich. All rights reserved.
//

import UIKit

protocol AnimalsViewControllerDelegate {
    func animalWasSelected(animal: String) -> Void
}

class AnimalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let CELL_IDENTIFIER = "animal_cell_identifier"

    var tableView: UITableView!
    var data: [String]!
    var delegate: AnimalsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Data for the table view
        self.data = ["Goat", "Pig", "Moose", "Okapi"]

        // Subviews
        self.tableView = UITableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)

        // Layout
        let views = ["tableView":self.tableView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|", options: [], metrics: nil, views: views))
    }

    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: CELL_IDENTIFIER)
        }

        cell!.textLabel?.text = self.data[indexPath.row]
        return cell!
    }
    

    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(true, completion: nil)
        if let _ = self.delegate {
            self.delegate!.animalWasSelected(self.data[indexPath.row])
        }
    }
}
