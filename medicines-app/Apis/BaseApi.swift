//
//  BaseApi.swift
//  medicines-app
//
//  Created by Pandu Abbiyuarsyah on 08/06/20.
//  Copyright © 2020 Pandu Abbiyuarsyah. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireNetworkActivityLogger

typealias SuccessResponse = (JSON?)  -> Void
typealias FailedResponse = (GenericResponse?)  -> Void

class BaseApi {
    
    class Endpoint {
        
        static let baseUrl : String = "https://private-anon-a1d57b2f4c-mymed.apiary-mock.com/"
    }
    
    static let instance = BaseApi()
    
    let genericResponse = GenericResponse()
    
    private var alamoFireManager: SessionManager = SessionManager.default
    private var currentRequest: Request?

    init() {
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        #else
        NetworkActivityLogger.shared.level = .off
        #endif
        self.setAFconfig()
    }
    
    private func setAFconfig() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 500
        configuration.timeoutIntervalForResource = 500
        self.alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    private func invalidateAndConfigure() {
        #if DEBUG
        NetworkActivityLogger.shared.stopLogging()
        #endif
        self.alamoFireManager.session.finishTasksAndInvalidate()
        self.setAFconfig()
    }
    
    func request(_ request: URLRequestConvertible, success:@escaping SuccessResponse, exception:@escaping FailedResponse) {
        #if DEBUG
        NetworkActivityLogger.shared.startLogging()
        #elseif RELEASE
        #endif
        currentRequest = alamoFireManager.request(request).responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonValue = JSON(value)
                success(jsonValue)
            case .failure(let error):
                self.genericResponse.info = "\(error)"
                exception(self.genericResponse)
            }
        }
    }
}
