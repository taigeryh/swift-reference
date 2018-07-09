//
//  RequestTest.swift
//  swift-reference
//
//  Created by taiyh on 2018/7/3.
//  Copyright © 2018年 __ORGANIZATION__. All rights reserved.
//

import Foundation
import ObjectMapper

class VersionResponse : Mappable {
    var origin: String = ""
    var url: String = ""
    var headers: VersionModel?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        origin         <- map["origin"]
        url          <- map["url"]
        headers         <- map["headers"]
    }
}

class VersionModel : Mappable {

    var Accept: String = ""
    var AcceptEncoding: String = ""
    var AcceptLanguage: String = ""
    var Connection: String = ""
    var Host: String = ""
    var Origin: String = ""
    var Referer: String = ""
    var UserAgent: String = ""
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Accept         <- map["Accept"]
        AcceptEncoding       <- map["Accept-Encoding"]
        AcceptLanguage         <- map["Accept-Language"]
        Connection       <- map["Connection"]
        Host           <- map["Host"]
        Origin         <- map["Origin"]
        Referer           <- map["Referer"]
        UserAgent           <- map["User-Agent"]
    }
}
