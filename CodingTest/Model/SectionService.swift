//
//  SectionService.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/10/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import Alamofire

public class SectionService: SectionServiceProtocol {
    public func getSections(callBack: @escaping ([Section]?) -> Void) {
        guard let url = URL(string: ConstantsURL.kSections ) else {
            callBack(nil)
            return
        }
        Alamofire.request(url, method: .get, parameters: nil).validate().responseJSON {[weak self] response in
            guard let _ = self else { return }
            guard response.result.isSuccess else {
                callBack(nil)
                return
            }
            guard let value = response.result.value as? [String: Any], let rows = value["sections"] as? [[String: Any]] else {
                callBack(nil)
                return
            }
            var listSections: [Section] = []
            for row in rows {
                guard let jsonData = try? JSONSerialization.data(withJSONObject:row) else {
                    callBack(nil)
                    return
                }
                let jsonDecoder = JSONDecoder()
                guard let section = try? jsonDecoder.decode(Section.self, from: jsonData) else {
                    callBack(nil)
                    return
                }
                listSections.append(section)
            }
            callBack(listSections)
        }
    }
}
