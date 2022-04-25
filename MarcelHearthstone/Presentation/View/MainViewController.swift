//
//  MainViewController.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 16/04/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let uiLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.text = "Hearthstone"
        uiLabel.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.2, alpha: 1.0)
        uiLabel.font = UIFont(name: "Avenir-Heavy", size: 40)
        return uiLabel
    }()
    
    let uiView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .white
        return uiView
    }()
    
    var cardsArray = Play()
    var tappedCell: CollectionViewCellCardModel?
    
    var classes: [String] = []
    var sets: [String] = []
    var types: [String] = []
    var factions: [String] = []
    var qualities: [String] = []
    var races: [String] = []
    
    private var cardViewModel = CardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)

        tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        tableView.separatorStyle = .none
        
        view.addSubview(uiLabel)
        view.addSubview(uiView)
        view.addSubview(tableView)
        
        uiLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 91).isActive = true
        uiLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 37).isActive = true

        uiView.topAnchor.constraint(equalTo: uiLabel.bottomAnchor, constant: 16).isActive = true
        uiView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 37).isActive = true
        uiView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        uiView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        tableView.topAnchor.constraint(equalTo: uiView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")
        
        getInfo()
    }
    
    func getInfo() {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callInfoApi { [self] (info, error) in
            for clazz in info.classes {
                self.classes.append(clazz)
            }
            let cardTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.classes, category: "Classes")
            for setx in info.sets {
                self.sets.append(setx)
            }
            let setTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.sets, category: "Sets")
            for types in info.types {
                self.types.append(types)
            }
            let typesTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.types, category: "Types")
            for faction in info.factions {
                self.factions.append(faction)
            }
            let factionsTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.factions, category: "Factions")
            for quality in info.qualities {
                self.qualities.append(quality)
            }
            let qualitiesTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.qualities, category: "Qualities")
            for race in info.races {
                self.races.append(race)
            }
            let racesTableViewCellModel: TableViewCellCardModel = loadCards(cards: self.races, category: "Races")
            
            self.cardsArray.objectsArray = []
            self.cardsArray.objectsArray.append(cardTableViewCellModel)
            self.cardsArray.objectsArray.append(setTableViewCellModel)
            self.cardsArray.objectsArray.append(typesTableViewCellModel)
            self.cardsArray.objectsArray.append(factionsTableViewCellModel)
            self.cardsArray.objectsArray.append(qualitiesTableViewCellModel)
            self.cardsArray.objectsArray.append(racesTableViewCellModel)
            
            DispatchQueue.main.async { [self] in
                self.tableView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
            }
        }
    }
    
    func loadCards(cards: [String], category: String) -> TableViewCellCardModel {
        var collection: [CollectionViewCellCardModel] = []
        for card in cards {
            let collectionViewCellModel = CollectionViewCellCardModel(color: UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1), cardName: card)
            collection.append(collectionViewCellModel)
        }
        var cards: [[CollectionViewCellCardModel]] = []
        cards.append(collection)
        let tableViewCellModel = TableViewCellCardModel(category: category, cards: cards)
        return tableViewCellModel
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cardsArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        let titleLabel = UILabel(frame: CGRect(x: 39, y: 00, width: 200, height: 22))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.text = cardsArray.objectsArray[section].category
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath) as? TableViewCell {

            let rowArray = cardsArray.objectsArray[indexPath.section].cards[indexPath.row]
            cell.updateCellWith(row: rowArray, cardName: cardsArray.objectsArray[indexPath.section].category)

            cell.cellDelegate = self
            
            cell.selectionStyle = .none
            return cell
       }
        return UITableViewCell()
    }
}

extension MainViewController: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        if let colorsRow = didTappedInTableViewCell.rowWithColors {
            self.tappedCell = colorsRow[index]

            let vc = DetailsViewController()
            vc.backgroundColor = tappedCell?.color
            vc.cardName = tappedCell?.cardName
            vc.category = didTappedInTableViewCell.category
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
