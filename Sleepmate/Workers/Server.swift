//
//  Server.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 23.01.2023.
//

import Alamofire
import Foundation
import SwiftyJSON

class Server {
    
    static let shared = Server()
    
    typealias serverResponse = (_ statusCode: Int, _ body: Any?) -> Void
    
    init(){}
    
    func getStatistics(completionHandler: @escaping(serverResponse)) {
        AF.request(URLs.STATISTIC, method: .get).responseData { response in
            switch response.response?.statusCode {
            case 200:
                if let data = response.data {
                    let json = JSON(data)
                    var statistics: [DailyStatistic] = []
                    for object in json.arrayValue {
                        statistics.append(DailyStatistic(date: object["date"].stringValue.toDate(.birthDateFormatOne)!,
                                                         sleepDuration: object["sleep-duration"].doubleValue,
                                                         deepSleepDuration: object["deep-sleep-duration"].doubleValue,
                                                         wakeUpCount: object["deep-sleep-count"].intValue,
                                                         bedTime: object["bed-time"].stringValue.toDate(.isoDateTimeSec)!,
                                                         wakeUpTime: object["bed-time"].stringValue.toDate(.isoDateTimeSec)!))
                    }
                    completionHandler(200, statistics)
                }
            case .none:
                completionHandler(0, nil)
            case .some(_):
                completionHandler(response.response!.statusCode, nil)
            }
        }
    }
    
    
}
