//
//  ViewController.swift
//  SuperHerosBook
//
//  Created by Faruk CANSIZ on 20.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var superKahramanIsimleri = [String]()
    var superKahramanGorselleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""
    
    //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Iron Man")
        superKahramanIsimleri.append("Spiderman")
        superKahramanIsimleri.append("Captain America")
        
        superKahramanGorselleri.append("batman")
        superKahramanGorselleri.append("superman")
        superKahramanGorselleri.append("ironman")
        superKahramanGorselleri.append("spiderman")
        superKahramanGorselleri.append("captainamerica")
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanGorselleri.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superKahramanIsimleri.remove(at: indexPath.row)
            superKahramanGorselleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahramanGorselleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        //performSegue viewController arası geçiş için yapılır
        
        //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            //detailsViewControllerdaki secilenKahramanİsmine ulaşmak için yapıyoruz
            
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenGorselIsmi = secilenGorsel
            //secilenisim ve secilengörsel ara değişkenler, bu ara değişkenlere asıl değişkeni eşitliyoruz sonra yeni değişkenleri ara değişkenlere eşitliyoruz
            
            
        }
    }
}

