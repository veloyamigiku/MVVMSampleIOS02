//
//  ViewController3.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/11/16.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UICollectionViewDataSource {
    
    private let colors: [UIColor] = [
        UIColor.black,
        UIColor.blue,
        UIColor.brown,
        UIColor.cyan,
        UIColor.darkGray,
        UIColor.darkText,
        UIColor.gray,
        UIColor.green,
        UIColor.lightGray,
        UIColor.orange,
        UIColor.red]
    private let colorNames: [String] = [
        "black",
        "blue",
        "brown",
        "cyan",
        "darkGray",
        "darkText",
        "gray",
        "green",
        "lightGray",
        "orange",
        "red"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margins = view.safeAreaLayoutGuide
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .cyan
        self.view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 20
        
        let customView1 = CustomView()
        let customView2 = CustomView()
        let customView3 = CustomView()
        let customView4 = CustomView()
        let customView5 = CustomView()
        stackView.addArrangedSubview(customView1)
        customView1.translatesAutoresizingMaskIntoConstraints = false
        customView1.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        stackView.addArrangedSubview(customView2)
        customView2.translatesAutoresizingMaskIntoConstraints = false
        customView2.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        stackView.addArrangedSubview(customView3)
        customView3.translatesAutoresizingMaskIntoConstraints = false
        customView3.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        stackView.addArrangedSubview(customView4)
        customView4.translatesAutoresizingMaskIntoConstraints = false
        customView4.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        stackView.addArrangedSubview(customView5)
        customView5.translatesAutoresizingMaskIntoConstraints = false
        customView5.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 1
        stackView.addArrangedSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.label.backgroundColor = colors[indexPath.item]
        cell.name.text = colorNames[indexPath.item]
        
        return cell
    }
    
}
