//
//  ViewController.swift
//  ImagelistTask
//
//  Created by AKSHAY VAIDYA on 14/04/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    

    var viewmodel = NetworkrequestViewModel()
    
    @IBOutlet weak var collectv: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCollection()
        viewmodel.getData(){
            DispatchQueue.main.async {
                
                self.collectv.reloadData()
                
            }
        }
    }

    func prepareCollection(){
        
        collectv.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        setImageSize()

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(UIDevice.current.orientation)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            self.setImageSize()
        }
        collectv.reloadData()
    }
    
    func setImageSize(){
      
          
                let layout = UICollectionViewFlowLayout()
                let width = (self.view.frame.width - 40)/3
                layout.itemSize = CGSize(width: width, height: width)
                
                self.collectv.collectionViewLayout = layout
              
          
            if UIDevice.current.orientation.isLandscape{
                
                let layout = UICollectionViewFlowLayout()
                let width = (self.view.frame.width - 20)/4
                layout.itemSize = CGSize(width: width, height: width)
                
                self.collectv.collectionViewLayout = layout
                
            }
//
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.datalist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.setData(model: viewmodel.datalist[indexPath.row])
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (view.frame.width - 40)/3
//        
//        return CGSize(width: width, height: width)
//    }

}

