//
//  NetworkViewModel.swift
//  ImagelistTask
//
//  Created by AKSHAY VAIDYA on 15/04/24.
//

import Foundation


class NetworkrequestViewModel{
    
    var datalist = [DataModelElement]()
    
    func getData(comp:(()->())? = nil){
        
        guard let url = URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100") else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url){data,res, err in
            
            guard let jsondata = data, let model = try? JSONDecoder().decode(DataModel.self, from: jsondata)
            else{
                
                return
            }
            
          //  print(model)
            self.datalist = model
            comp?()
        }.resume()
        
        
    }
    
}

