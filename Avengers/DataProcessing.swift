//
//  data.swift
//  Avengers
//
//  Created by sixpep on 05/02/23.
//

import Foundation

class DataProcessing{
    weak var delegate: DataDelegate?
    
    var jsonData = [jsonStruct]()
    
    func setData(url:String){
        let urlString = url
        let url = URL(string:urlString)
        guard url != nil else{
            return  }
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!) { (data, respponse, error) in
                
                do{
                    if error == nil && data != nil{
                        self.jsonData = try JSONDecoder().decode([jsonStruct].self,from: data!)
                        self.delegate?.didReceiveData(data: self.jsonData)
                        
                    }
                }catch{
                    print("Problem in Json parsing")
                }
            }.resume()
        }
    

}
protocol DataDelegate: AnyObject {
    func didReceiveData(data: [jsonStruct])
}
