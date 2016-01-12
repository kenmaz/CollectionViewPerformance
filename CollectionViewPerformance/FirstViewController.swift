//
//  FirstViewController.swift
//  CollectionViewPerformance
//
//  Created by Kentaro Matsumae on 2016/01/12.
//  Copyright © 2016年 kenmaz.net. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    private var datasource = MyDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = datasource
    }
}
