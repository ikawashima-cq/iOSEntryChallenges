import UIKit

final class APIClient {

    static func fetchEvents(keyword: String,
                            completion: @escaping(Result<[Event], Error>) -> Void ) {
        
        var urlComps = URLComponents(string: "https://connpass.com/api/v1/event")!
        let queryItems = [URLQueryItem(name: "count", value: "20"),
        URLQueryItem(name: "keyword", value: keyword)]
        urlComps.queryItems = queryItems
        
        let session = URLSession(configuration: .default)
        guard let url = urlComps.url else { return }
        let request = URLRequest(url: url)

        let task = session.dataTask(with: request, completionHandler: {data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(Events.self, from: data)
                completion(.success(response.events))
                
            } catch {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}
