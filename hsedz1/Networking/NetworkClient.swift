//
//  NetworkClient.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 13.03.2026.
//

import Foundation

final class NetworkClient {
    private let baseURL: URL
    private let session: URLSession

    init(baseURL: URL? = URL(string: "https://ipinfo.io"), session: URLSession = .shared) {
        guard let baseURL else {
            fatalError("Base URL is not set")
        }
        self.baseURL = baseURL
        self.session = session
    }

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try makeRequest(from: endpoint)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200 ..< 300) ~= httpResponse.statusCode
        else {
            throw NetworkError.invalidResponse
        }

        guard let data = data as? T else {
            throw NetworkError.emptyData
        }

        return data
    }

    private func makeRequest(from endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = baseURL.scheme
        components.host = baseURL.host
        components.path = endpoint.path

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        return request
    }
}
