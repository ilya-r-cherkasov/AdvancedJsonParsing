//
//  NetworkManager.swift
//  AdvancedJsonParsing
//
//  Created by Ilya Cherkasov on 15.09.2021.
//

import Foundation

final class NetworkManager {
    
    func downloadList() {
        let url = URL(string: "https://storage.yandexcloud.net/ilya-cherkasov/test.json")
        downloadData(url: url!) { [weak self] result in
            switch result {
            case .success(let data):
                self?.parseJson(data: data, type: MainScreenModels.self) { mainScreenModel in
                    print(mainScreenModel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func downloadData(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)
        ) { data, response, error in
            guard let data = data,
                  error == nil else { completion(.failure(error!)); return }
            completion(.success(data))
        }
        task.resume()
    }
    
    func parseJson<T: Codable>(data: Data, type: T.Type, completion: (T) -> Void) {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            completion(result)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
