//
//  ImageCell.swift
//  ImagelistTask
//
//  Created by AKSHAY VAIDYA on 14/04/24.
//

import UIKit

class ImageCell: UICollectionViewCell {

  
    @IBOutlet weak var imgv: UIImageView!
    var imagecatche = NSCache<AnyObject,UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(model:DataModelElement){
        
        let urlstring = "\(model.thumbnail?.domain ?? "")/\(model.thumbnail?.basePath ?? "")/\(model.thumbnail?.qualities?.first ?? 00)/\(model.thumbnail?.key ?? "")"
        
        guard let imgurl = URL(string: urlstring) else{
            
            return
        }
        if let imgcatch = imagecatche.object(forKey: imgurl as AnyObject){
            self.imgv.image = imgcatch
           // print("catchee")
            
        }
        else{
        
        
        DispatchQueue.global().async {
            
            let data = try? Data(contentsOf: imgurl)
            DispatchQueue.main.async {
              //  print("server")
                if let image =  UIImage(data: data ?? Data()){
                    self.imagecatche.setObject(image, forKey: imgurl as AnyObject)
                    self.imgv.image = UIImage(data: data ?? Data())
                    
                }
                else{
                    
                    self.imgv.image = UIImage(systemName: "photo")
                }
            }
        }
        
    }
    }

}
