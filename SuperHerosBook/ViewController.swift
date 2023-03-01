//
//  ViewController.swift
//  SuperHerosBook
//
//  Created by Faruk CANSIZ on 20.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHerosNames = [String]()
    var superHerosImages = [String]()
    var chosenName = ""
    var chosenImage = ""
    
    //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        superHerosNames.append("Batman")
        superHerosNames.append("Superman")
        superHerosNames.append("Iron Man")
        superHerosNames.append("Spiderman")
        superHerosNames.append("Captain America")
        
        superHerosImages.append("batman")
        superHerosImages.append("superman")
        superHerosImages.append("ironman")
        superHerosImages.append("spiderman")
        superHerosImages.append("captainamerica")
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHerosImages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHerosNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHerosNames.remove(at: indexPath.row)
            superHerosImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = superHerosNames[indexPath.row]
        chosenImage = superHerosImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        //performSegue viewController arası geçiş için yapılır
        
        //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            //detailsViewControllerdaki secilenKahramanİsmine ulaşmak için yapıyoruz
            
            destinationVC.chosenHeroName = chosenName
            destinationVC.chosenImageName = chosenImage
            //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
            
            
        }
    }
}

