//
//  MyDatasource.swift
//  CollectionViewPerformance
//
//  Created by Kentaro Matsumae on 2016/01/12.
//  Copyright © 2016年 kenmaz.net. All rights reserved.
//

import UIKit

final class MyDatasource: NSObject, UICollectionViewDataSource {

    lazy private var list:[(String,String)] = {
        var list:[(String, String)] = []
        
        let chars = ["あ", "い", "う", "え", "お"]
        let charcnt = chars.count
        
        for i in 0...100 {
            var str = ""
            let wordCnt = (arc4random() % 20) + 1
            for _ in 0...wordCnt {
                let cidx = Int((arc4random() % UInt32(charcnt)))
                let c = chars[cidx]
                str += c
            }
            let thumb = i % 3 == 0 ? "grid.png" : "grid2.png"
            list.append((str, thumb))
        }

//        for i in 0...100 {
//            let title = NSUUID().UUIDString
//            let thumb = i % 3 == 0 ? "grid.png" : "grid2.png"
//            list.append((title, thumb))
//        }
        
        return list
    }()

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCell
        let (str, thumb) = list[indexPath.row]
        cell.label.text = str
        cell.subLabel.text = str
        cell.volLabel.text = str
        cell.imageView.image = UIImage(named: thumb)
        return cell
    }
}
