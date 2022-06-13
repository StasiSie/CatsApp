//
//  ResultViewController.swift
//  CatsApp
//
//  Created by Игорь Богданов on 02.06.2022.
//

import UIKit
import Alamofire

class ResultViewController: UIViewController {
    
    private var spinnerView: UIActivityIndicatorView?
    
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var factlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView = showSpinner(in: photoImage)
        getData()
    }
    
   private func showSpinner(in view: UIView)-> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.startAnimating()
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        
        view.addSubview(indicator)
        
        return indicator
    }
    
    private func getImage() {
        let url = UrlManager.shared.urlLink
        let image = ImageManager.shared.fetchImage(from: url )
        photoImage.image = UIImage(data: image!)
        spinnerView?.stopAnimating()
    }
   
    private func getFact() {
        NetworkManager.shared.fetchData { catFacts in
            DispatchQueue.main.async {
                let fact = catFacts.randomElement()
                self.factlabel.text = fact?.text ?? ""
            }
        }
    }
    
    private func getData() {
        getImage()
        getFactWithAlamofire()
        spinnerView?.stopAnimating()
    }
    
    private func getFactWithAlamofire() {
        NetworkManager.shared.fetchDataWithAlamofire { catFact in
            DispatchQueue.main.async {
                self.factlabel.text = catFact.text ?? "OOps something went wrong"
            }
            
        }
    }
}
