//
//  ViewController.swift
//  CatsApp
//
//  Created by Игорь Богданов on 01.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var filterControl: UISegmentedControl!
    @IBOutlet var tagControl: UISegmentedControl!
    @IBOutlet var randomSwitch: UISwitch!
    
    private let url = UrlManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func getRandomCat() {
        if randomSwitch.isOn == true {
            filterControl.selectedSegmentIndex = 0
            tagControl.selectedSegmentIndex = 0
        }
    }
    func setUrl() {
        let tag = tagControl.selectedSegmentIndex
        
        switch tag {
        case 1:
            url.tag = .cute
        case 2:
            url.tag = .angry
        case 3:
            url.tag = .confused
        case 4:
            url.tag = .fluffy
        default:
            url.tag = .none
        }
        
        let filter = filterControl.selectedSegmentIndex
        
        switch filter {
        case 1:
            url.filter = .sepia
        case 2:
            url.filter = .bokeh
        case 3:
            url.filter = .typography
        case 4:
            url.filter = .street
        default:
            url.filter = .none
        }
    }

}

