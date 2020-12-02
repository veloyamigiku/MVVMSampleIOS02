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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.layer.borderColor = UIColor.black.cgColor
        collectionView.layer.borderWidth = 1.0
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
