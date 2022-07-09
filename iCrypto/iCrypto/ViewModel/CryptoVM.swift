//
//  CryptoVM.swift
//  iCrypto
//
//  Created by Майлс on 30.06.2022.
//

import Foundation
import Combine

class CryptoVM: ObservableObject {
    
    @Published var cryptoAndCurrency: [Currency] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getDataFromAPI()
    }
    
    /// Метод получения данных с api
    ///  - Создаем Publisher
    ///  - Подписываем процесс Publisher в фоновый поток методом .subscribe
    ///  - Получаем данные обратно в основном потоке методом .receive
    ///  - Проверяем не поврежденные ли полученные данные методом .tryMap
    ///  - Расшифровка данных методом .decode(JSONDecoder())
    ///  - Помещение данных в массив методом .sink
    ///  - Хранение и возможность отмены подписки по необходимости методом .store
    func getDataFromAPI() {
        
        guard let url = URL(string: "https://bitpay.com/api/rates") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(complitionHandler)
            .decode(type: [Currency].self, decoder: JSONDecoder())
            .sink { complition in
                print("COMPLITION: \(complition)")
            } receiveValue: { [weak self] returnedCoins in
                self?.cryptoAndCurrency = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    /// Метод проверки на ответ сервера
    ///   - Параметр output - данные, которые будут "опубликованы"
    ///   - Возвращает данные, если statusCode соответствует заданным параметрам
    private func complitionHandler(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let responce = output.response as? HTTPURLResponse,
            responce.statusCode >= 200 && responce.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        return output.data
    }
}
