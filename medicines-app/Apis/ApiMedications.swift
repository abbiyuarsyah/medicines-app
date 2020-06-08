//
//  ApiMedications.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import Foundation
import Alamofire

enum ApiMedications: URLRequestConvertible {
    
    case fetchMedicationList
    case fetchMedicationDetail(id: String)

    var path: String {
        switch self {
        case .fetchMedicationList:
            return "\(ApiConfigConstant.apiVersion)/medications"
        case .fetchMedicationDetail(let id):
            return "\(ApiConfigConstant.apiVersion)/medications/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMedicationList:
            return .get
        case .fetchMedicationDetail(_):
            return .get
        }
    }
    
    var parameter: [String: AnyObject] {
        switch self {
        case .fetchMedicationList:
            return [:]
        case .fetchMedicationDetail(_):
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try BaseApi.Endpoint.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(HttpHeaderConstant.applicationJson, forHTTPHeaderField: HttpHeaderConstant.contentType )
        if method == .post {
            let data = try! JSONSerialization.data(withJSONObject: self.parameter, options: JSONSerialization.WritingOptions.prettyPrinted)
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            urlRequest.httpBody = json?.data(using: String.Encoding.utf8.rawValue)
        }
        return urlRequest
    }
}
