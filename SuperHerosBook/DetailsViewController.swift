//
//  DetailsViewController.swift
//  SuperHerosBook
//
//  Created by Faruk CANSIZ on 21.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var chosenHeroName = ""
    var chosenImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: chosenImageName)
        label.text = chosenHeroName

    }
    
//ikinci viewController da yeni değişkenler atayıp imageView ve label'ı bu yeni değişkenlere eşitledik
    
    //şimdi asıl viewControllerda asıl kahraman ve gorsel isimleri değişkenlerini ara bir değişkene eşitliyoruz ve bu ara değişkeni de ikinci view controllerda oluşturduğumuz yeni değişkenlere eşitliyoruz böylece ara değişken sayesinde asıl değişkenle yeni değişken arasında bağlantı kurmuş oluyoruz
    

}
