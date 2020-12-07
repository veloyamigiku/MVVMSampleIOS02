//
//  ViewController4.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/12/02.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class ViewController4: UIViewController, UICollectionViewDataSource {
    
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
    
    private var giveColor: UIColor = UIColor.black
    private var giveColorName: String = "black"
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margins = view.safeAreaLayoutGuide
        
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        // スクロール方向を設定する。
        layout.scrollDirection = .horizontal
        // スクロール方向の間隔を設定する。
        layout.minimumLineSpacing = 10
        // セルサイズを設定する。
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // 背景色はデフォルトで黒なので、白に設定する。
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 1.0
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -5).isActive = true
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
