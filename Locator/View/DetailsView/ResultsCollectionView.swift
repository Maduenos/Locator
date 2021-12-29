//
//  ResultsCollectionView.swift
//  Locator
//
//  Created by Mahammad on 28.12.2021.
//

import UIKit

class DetailsCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var selectedPlace: Result
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! DetailsCollectionViewCell
        
        cell.currentPlace = selectedPlace
        cell.cellRow = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    @objc func refreshCollectionView () {
        collectionView.reloadData()
    }
    
    func addCollection () {
        addSubview(collectionView)
    }
    
    func registerCell () {
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
    }
    
    func adjustcollectionViewProperties () {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    func constraintsSet() {
        guard let parent = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 1).isActive = true
        heightAnchor.constraint(equalToConstant: 230).isActive = true
        topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
    
    func setDesign () {
        collectionView.backgroundColor = .clear
        backgroundColor = .clear
        clipsToBounds = true
    }
    
    func setHorizontalPaging () {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.collectionViewLayout = layout
    }
    
    override func didMoveToSuperview() {
        constraintsSet()
        adjustcollectionViewProperties()
    }
    
    init (_ selectedPlace: Result) {
        self.selectedPlace = selectedPlace
        
        super.init(frame: .zero)
        
        registerCell()
        addCollection()
        setDesign()
        setHorizontalPaging()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        collectionView.dataSource = nil
        collectionView.delegate = nil
        collectionView.removeFromSuperview()
    }
    
}
