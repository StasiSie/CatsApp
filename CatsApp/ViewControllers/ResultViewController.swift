//
//  ResultViewController.swift
//  CatsApp
//
//  Created by Игорь Богданов on 02.06.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var factlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
        getFact()
    }
    
    func getImage() {
        let url = UrlManager.shared.urlLink
        let image = ImageManager.shared.fetchImage(from: url )
        photoImage.image = UIImage(data: image!)
        
    }
   
    func getFact() {
        NetworkManager.shared.fetchData { catFacts in
            DispatchQueue.main.async {
                let fact = catFacts.randomElement()
                self.factlabel.text = fact?.text ?? ""
            }
        }
    }

}
