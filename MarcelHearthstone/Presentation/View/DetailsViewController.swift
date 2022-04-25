//
//  DetailsViewController.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 16/04/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let circleUIImageView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named: "circleBackButton.png")
        return uiImageView
    }()

    let arrowUIImageView: UIImageView = {
        let uiImageView = UIImageView()
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        uiImageView.image = UIImage(named: "arrowBackButton.png")
        return uiImageView
    }()
    
    let uiLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.font = UIFont(name: "Avenir-Regular", size: 22)
        uiLabel.textColor = UIColor(red: 0.13, green: 0.13, blue: 0.2, alpha: 1.0)
        return uiLabel
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    private enum LayoutConstant {
        static let spacing: CGFloat = 16
        static let itemHeight: CGFloat = 223
    }
    
    var backgroundColor: UIColor?
    var cardName: String?
    var category: String?
    var cards: [Card] = []
    
    var classesImg: [String] = []
    var setsImg: [String] = []
    var typesImg: [String] = []
    var factionsImg: [String] = []
    var qualitiesImg: [String] = []
    var racesImg: [String] = []
    
    private var cardViewModel = CardViewModel()
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        setupViews()
        setupLayouts()
        
        uiLabel.text = category
        
        circleUIImageView.isUserInteractionEnabled = true
        circleUIImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        guard let cardName = cardName else {
            return
        }

        if category == "Classes" {
            getClasses(param: cardName)
        } else if category == "Sets" {
            getSets(param: cardName)
        } else if category == "Types" {
            getTypes(param: cardName)
        } else if category == "Factions" {
            getFactions(param: cardName)
        } else if category == "Qualities" {
            getQualities(param: cardName)
        } else if category == "Races" {
            getRaces(param: cardName)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(circleUIImageView)
        circleUIImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        circleUIImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        circleUIImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        circleUIImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 91).isActive = true
        
        circleUIImageView.addSubview(arrowUIImageView)
        arrowUIImageView.centerXAnchor.constraint(equalTo: circleUIImageView.centerXAnchor).isActive = true
        arrowUIImageView.centerYAnchor.constraint(equalTo: circleUIImageView.centerYAnchor).isActive = true

        view.addSubview(uiLabel)
        uiLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31).isActive = true
        uiLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 109).isActive = true

        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: circleUIImageView.bottomAnchor, constant: 34),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func populateCards(imgs: [String]) {
        cards = []
        for img in imgs {
            let card = Card(img: img)
            cards.append(card)
        }
    }
    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getClasses(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "classes", param: param, resultType: [Classe].self) { [self] (classe, error) in
            for clazz in classe {
                if let clz = clazz.img {
                    self.classesImg.append(clz)
                }
            }
            populateCards(imgs: self.classesImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.classesImg.isEmpty {
                    validate()
                }
            }
        }
    }

    func getSets(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "sets", param: param, resultType: [SetX].self) { [self] (sets, error) in
            for setz in sets {
                if let stz = setz.img {
                    self.setsImg.append(stz)
                }
            }
            populateCards(imgs: self.setsImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.setsImg.isEmpty {
                    validate()
                }
            }
        }
    }
    
    func getTypes(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "types", param: param, resultType: [TypeX].self) { [self] (types, error) in
            for typex in types {
                if let tpx = typex.img {
                    self.typesImg.append(tpx)
                }
            }
            populateCards(imgs: self.typesImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.typesImg.isEmpty {
                    validate()
                }
            }
        }
    }

    func getFactions(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "factions", param: param, resultType: [Faction].self) { [self] (factions, error) in
            for faction in factions {
                if let fct = faction.img {
                    self.factionsImg.append(fct)
                }
            }
            populateCards(imgs: self.factionsImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.factionsImg.isEmpty {
                    validate()
                }
            }
        }
    }

    func getQualities(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "qualities", param: param, resultType: [Quality].self) { [self] (qualities, error) in
            for quality in qualities {
                if let qlt = quality.img {
                    self.qualitiesImg.append(qlt)
                }
            }
            populateCards(imgs: self.qualitiesImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.qualitiesImg.isEmpty {
                    validate()
                }
            }
        }
    }

    func getRaces(param: String) {
        Loading.showActivityIndicator(uiView: self.view)
        cardViewModel.callCardApi(resource: "races", param: param, resultType: [Race].self) { [self] (races, error) in
            for race in races {
                if let rce = race.img {
                    self.racesImg.append(rce)
                }
            }
            populateCards(imgs: self.racesImg)
            DispatchQueue.main.async { [self] in
                self.collectionView.reloadData()
                Loading.hideActivityIndicator(uiView: self.view)
                if self.racesImg.isEmpty {
                    validate()
                }
            }
        }
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell

        let profile = cards[indexPath.row]
        cell.setup(with: profile)
        return cell
    }
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 160, height: 223)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: 30, bottom: LayoutConstant.spacing, right: 29)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension DetailsViewController {
    func validate() {
        let alert = UIAlertController(title: "Atenção", message: "Não há cards para essa categoria", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
