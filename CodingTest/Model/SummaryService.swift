//
//  SummaryService.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import Alamofire

public class SummaryService: SummaryServiceProtocol {
    public func getSummary(callBack: @escaping (Summary?) -> Void) {
        guard let url = URL(string: ConstantsURL.kSummary) else {
            callBack(nil)
            return
        }
        Alamofire.request(url, method: .get, parameters: nil).validate().responseJSON {[weak self] response in
            guard let _ = self else { return }
            guard response.result.isSuccess else {
                callBack(nil)
                return
            }
            guard let value = response.result.value as? [String: Any] else {
                callBack(nil)
                return
            }
            guard let jsonData = try? JSONSerialization.data(withJSONObject:value) else {
                callBack(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            guard let summary = try? jsonDecoder.decode(Summary.self, from: jsonData) else {
                callBack(nil)
                return
            }
            callBack(summary)
        }
    }
}
