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
                        statistics.append(
                            DailyStatistic(  date: object["date"].stringValue.toDate(.birthDateFormatOne)!,
                                             sleepDuration: object["sleep-duration"].doubleValue,
                                             deepSleepDuration: object["deep-sleep-duration"].doubleValue,
                                             wakeUpCount: object["deep-sleep-count"].intValue,
                                             bedTime: object["bed-time"].stringValue.toDate(.isoDateTimeSec)!,
                                             wakeUpTime: object["wake-up-time"].stringValue.toDate(.isoDateTimeSec)!)
                        )
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
    
    
    func getExperts() -> [Expert] {
        return [
            Expert(name: "John", lastName: "Balantines", avatarLink: nil, gender: .man, shortDesctiprion: "12 years of experience, Sleep Analyst", workExpitience: 4319),
            Expert(name: "Lawson", lastName: "William", avatarLink: nil, gender: .woman, shortDesctiprion: "8 years of experience, Sleep Analyst", workExpitience: 2920),
            Expert(name: "Jameson", lastName: "Khortitsa", avatarLink: nil, gender: .man, shortDesctiprion: "10 years of experience, Sleep Analyst", workExpitience: 3650),
            Expert(name: "John", lastName: "Balantines", avatarLink: nil, gender: .man, shortDesctiprion: "12 years of experience, Sleep Analyst", workExpitience: 4319),
            Expert(name: "Lawson", lastName: "William", avatarLink: nil, gender: .woman, shortDesctiprion: "8 years of experience, Sleep Analyst", workExpitience: 2920),
            ]
        
    }
    
    
}
