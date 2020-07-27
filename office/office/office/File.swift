//
//  File.swift
//  office
//
//  Created by 廖昱晴 on 2020/7/23.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import Foundation
class ServiceOffice {
    var name: String
    var address: String
    var phone: String
    
    init(name: String, address: String,phone: String) {
        self.name = name
        self.address = address
        self.phone = phone
    }
    convenience init(){
        self.init(name:"",address:"",phone:"")
    }
        
}
