//
//  APICaller.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 5/11/23.
//

import Foundation

struct Constants {
    static let baseURL = "http://192.168.43.32:8085/api/v2/zpoin/api/user/wallets"
//    static let baseURL = "https://jsonplaceholder.typicode.com/posts"
    static let accessToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZWU0OWE4Yjk4YTBmNDIzNDQ0NjQ5NThiYjk5Y2Y5MjY0YjI2NThjZDI2NDgyYTMzYWExMWRiMDRlOGZiNWJkNmVlYWUzNDFlNDMyMzk3Y2IiLCJpYXQiOjE2ODM3ODgyNjcuMTk4MTY2LCJuYmYiOjE2ODM3ODgyNjcuMTk4MTY5LCJleHAiOjE3MTU0MTA2NjQuNDU2MDQ0LCJzdWIiOiI1MTA3Iiwic2NvcGVzIjpbXX0.GGhfjUWdWOf5a_QrHgvnqLlv8d9dydtY1ayWpJIkLihqytKIGOQgCqiKa-g8AyeyO50J9tpt9p52K_qblX7KU4kXBBUKheK1kkhf5jWbefO4IKPMBN9yyChF8x4zxC4NkMYR6shZGPA4fd2qw5t4juqz6OMqCqVQeA26RGTHjm5lXNgFl2qYFcNcTW0hWyoxRMrunttwbpW8F7W819ICc49ponCBRBZ0gszd8_RkUT9ZGUPMzW2xmg6iAMBKkWYLuxxo-P7TcvSk8vyyppbr3gu5B0NBD1sdLL0uDyBuPh-HAPz_CclZZN19fLii02sZbNzp8AqNdiD7BGYfdqd53HSEjD9KdxC0cZ-ZWehP2ZAWI9uB6MAysPEH0CLVmtvXAyHREOgHenZwyJ7UkjbtxXYBe1-uR0n8OwsVO5IXsyr3fwBlWJOufLGekJW_ooZjNVSTVPC3i8Gw3oanUmS03PU0Vx33lLHoT6-ZBC1CszFvufu8ClBSLjgALox9obNcrrRvx_o22fm2ZLIqVj5aNMx46VxoT23anWp4ZXV1iNZCUyMZM4S1Et6JfoOK9lrarK-LrrSiibNsgDzGx-jitBh53D_bIlfTxuoBOpzkazR9L-SCiZejAq1aN5KoMKwyrnzyQ26zOBQXgnPenYy0pVQxx4uBDrlxrquleepQcLo"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
//    func getDataAPIZpoin(){
//        guard let url = URL(string: Constants.baseURL) else {
//            return
//        }
//
//        var getRequest = URLRequest(url: url)
//        getRequest.addValue(Constants.accessToken, forHTTPHeaderField: "Authorization")
//        let session = URLSession.shared.dataTask(with: getRequest){
//            data, response, error in
//            if let error = error {
//                print("There was an error: \(error.localizedDescription)")
//            }else {
//                let jsonRes =  try? JSONSerialization.jsonObject(with: data!, options: [])
//                print("The response: \(jsonRes)")
//
//            }
//        }.resume()
        
    
//    Result<[Test2WithAlamofireModel], Error>
    
    func getDataAPIZPoin(completion: @escaping (Result<[ZpoinAssModel], Error>) -> Void) {
        guard let url = URL(string: Constants.baseURL) else { return }
        var getRequest = URLRequest(url: url)
        getRequest.httpMethod = "Get"
        getRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        getRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        getRequest.addValue(Constants.accessToken, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: getRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                print("I Love You Bro")
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
                let results = try JSONDecoder().decode(ZpoinAssModel.self, from: data)
    
                completion(.success(results.success))

            } catch {
                completion(.failure(APIError.failedTogetData))
//                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
