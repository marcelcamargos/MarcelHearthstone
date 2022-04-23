//
//  CardCollectionViewCell.swift
//  MarcelHearthstone
//
//  Created by Marcel Gonçalves Viana Marins de Camargos on 17/04/22.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class CardCollectionViewCell: UICollectionViewCell {

    private enum Constants {
        // MARK: contentView layout constants
        static let contentViewCornerRadius: CGFloat = 4.0

        // MARK: profileImageView layout constants
        static let imageHeight: CGFloat = 223
    }

    private let cardImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white

        contentView.addSubview(cardImageView)
    }

    private func setupLayouts() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cardImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with card: Card) {
        cardImageView.loadImage(withUrl: card.img)
    }
}


extension CardCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
