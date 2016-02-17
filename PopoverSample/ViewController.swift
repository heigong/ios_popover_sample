//
//  ViewController.swift
//  PopoverSample
//
//  Created by Jeffrey Ondich on 2/16/16.
//  Copyright © 2016 Jeff Ondich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, AnimalsViewControllerDelegate {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var animalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handleButton(button: UIButton) {
        // So far, animalsVC is just a view controller.
        let animalsVC = AnimalsViewController()
        animalsVC.delegate = self
        animalsVC.preferredContentSize = CGSize(width: 300, height: 200)

        // Now we say that we want it to be a popover. We also use the popoverPresentationController delegate
        // (see adaptivePresentationStyleForPresentationController below) to make the popover behavior right.
        // for iPhone. On iPhone, the default popover style is to fill the entire screen. We want something
        // less disruptive than that.
        animalsVC.modalPresentationStyle = UIModalPresentationStyle.Popover

        let presentationController = animalsVC.popoverPresentationController
        presentationController?.delegate = self;
        presentationController?.permittedArrowDirections = .Any
        presentationController?.sourceView = button
        presentationController?.sourceRect = button.bounds

        self.presentViewController(animalsVC, animated: true, completion: nil)
    }

    // MARK: UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

    // MARK: AnimalsViewControllerDelegate
    func animalWasSelected(animal: String) {
        self.animalLabel.text = animal
    }
}

