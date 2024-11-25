//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Arda Özel on 25.11.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson: Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    //Simpson Objetcs
    
    let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
    let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "marge")!)
    let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
    let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
    let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "baby", simpsonImage: UIImage(named: "maggie")!)
    let mrburns = Simpson(simpsonName: "Mr. Burns", simpsonJob: "Businessman", simpsonImage:UIImage(named: "mrburns")!)
    
    mySimpsons.append(homer)
    mySimpsons.append(marge)
    mySimpsons.append(bart)
    mySimpsons.append(lisa)
    mySimpsons.append(maggie)
    mySimpsons.append(mrburns)
    
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! detailsVC
                destinationVC.selectedSimpson = chosenSimpson
            }
        }
    }
    


