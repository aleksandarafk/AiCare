//
//  OpenAIService.swift
//  AiCare
//
//  Created by Aleksandar Karamirev on 10/03/2023.
//

import Foundation
import Alamofire
import Combine

class OpenAIService {
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompleteResonse, Error>{
        let body = OpenAIBody(model: "text-davinci-003", prompt: message, temperature: 0.8, max_tokens: 2000)
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(Constants.openAPIKey)"
        ]
        return Future { [weak self] promise in guard let self = self else {return}
            AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompleteResonse.self) { response in
                switch response.result {
                case .success(let result):
                    promise(.success(result))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

struct OpenAIBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}

struct OpenAICompleteResonse: Decodable {
    let id: String
    let choices: [OpenAICompleteChoice]
}

struct OpenAICompleteChoice: Decodable {
    let text: String
}

