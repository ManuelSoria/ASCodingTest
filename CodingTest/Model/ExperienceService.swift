//
//  ExperienceService.swift
//  CodingTest
//
//  Created by Manuel Alejandro Soria Hidalgo on 5/8/19.
//  Copyright © 2019 Manuel Alejandro Soria Hidalgo. All rights reserved.
//

import Foundation
import Alamofire

public class ExperienceService: ExperienceServiceProtocol {
    func getExperience(callBack: @escaping ([Experience]?) -> Void) {
        guard let url = URL(string: ConstantsURL.kExperience) else {
            callBack(nil)
            return
        }
        Alamofire.request(url, method: .get, parameters: nil).validate().responseJSON {[weak self] response in
            guard let _ = self else { return }
                guard response.result.isSuccess else {
                        callBack(nil)
                    return
                }
            guard let value = response.result.value as? [String: Any], let rows = value["jobs"] as? [[String: Any]] else {
                    callBack(nil)
                    return
            }
            var listExperience: [Experience] = []
            for row in rows {
                guard let jsonData = try? JSONSerialization.data(withJSONObject:row) else {
                    callBack(nil)
                    return
                }
                let jsonDecoder = JSONDecoder()
                guard let experience = try? jsonDecoder.decode(Experience.self, from: jsonData) else {
                    callBack(nil)
                    return
                }
                listExperience.append(experience)
            }
            callBack(listExperience)
        }
    }
}
