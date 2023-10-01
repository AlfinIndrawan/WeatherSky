import WeatherKit
import Foundation
import CoreLocation
import OSLog

final class WeatherManager {
  let logger = Logger(subsystem: "com.alfinindrawan.WeatherSky", category: "WeatherManager")
  static let shared = WeatherManager()
  
  let service = WeatherService.shared
  
  // expose computed property
  
  
  public private (set)var currentWeather: CurrentWeather?
  public private (set)var hourlyWeather: [HourWeather]?
  public private (set)var dailyWeather: [DayWeather]?
  
  private init() {
    
  }
  
  public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
    Task {
      do {
        let result = try await service.weather(for: location)
        print("\(result.currentWeather)")
        self.logger.info("\(String(describing: "Current: \(result.currentWeather)"))")
        self.logger.info("\(String(describing: "Hourly: \(result.hourlyForecast)"))")
        self.logger.info("\(String(describing: "daily: \(result.dailyForecast)"))")
        self.hourlyWeather = result.hourlyForecast.forecast
        self.currentWeather = result.currentWeather
        self.dailyWeather = result.dailyForecast.forecast
        completion()
      } catch {
        logger.error("cant fetch weather service")
      }
    }
  }
}
