//
//  ViewController.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/10/21.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift
import RxDataSources

class ViewController: UIViewController, UITableViewDelegate {
    
    private var disposeBag: DisposeBag!
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionOfCustomData>!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disposeBag = DisposeBag()
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(configureCell: {(ds: TableViewSectionedDataSource<SectionOfCustomData>, tableView: UITableView, indexPath: IndexPath, model: CustomData) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = model.str
            return cell
        })
        dataSource.titleForHeaderInSection = {ds, index in
            return ds.sectionModels[index].header
        }
        
        let sections = [
            SectionOfCustomData(header: "First section", items: [
                CustomData(str: "zero"),
                CustomData(str: "one")
            ]),
            SectionOfCustomData(header: "Second section", items: [
                CustomData(str: "two"),
                CustomData(str: "three")
            ])
        ]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        let httpGet = HttpGet()
        httpGet
            .exec(
                url: "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch",
                query: [
                    "appid": "dj00aiZpPWVheHgxT3VmSmp0eSZzPWNvbnN1bWVyc2VjcmV0Jng9YzU-",
                    "query": "last of us"])
        httpGet
            .getData()
            .subscribe(onNext: { (data) in
                do {
                    let json = try JSON(data: data)
                    print(json)
                } catch let jsonError {
                    print(jsonError)
                }
            })
            .disposed(by: disposeBag)
    }


}

