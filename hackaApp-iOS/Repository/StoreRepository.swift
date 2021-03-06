//
//  StoreRepository.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

class StoreRepository {
    
    
    func getStoreItems() {
//        let url = "https://hacka-ibm-team-24.herokuapp.com/api/v1/store"
        let url = "https://820b2565.us-south.apigw.appdomain.cloud/ibm-gateway/api/v1/store"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: false) { (result, err) in
            if result != nil {
                
                let decoder = JSONDecoder()
                do {
                    print("teste1")
                    let storeItems = try decoder.decode(StoreItems.self, from: result as! Data)
//                    print(questions.questions?[0].products?[0].info ?? "")
                    Singleton.shared.storeItems = storeItems.storeItems
                    print("teste2")
                }
                catch let error {
                    print("ESTAMOS NO CATCH \n")
                    print(error)
                }
                
                
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "StoreItemsLoaded"), object: nil) // AnucniosCarregados
                }
            }
            else {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoCarregar"), object: nil)
                }
            }
            
        }
    }
    
}

// exemplo para pegar os dados JSON
//var a = dictResult["questions"] as! [[String : Any?]]
//print(a[0]["title"] as! String)
//a.count
