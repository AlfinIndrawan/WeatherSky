import Foundation
import RevenueCat

final class IAPManager {
  static let shared = IAPManager()
  
  private init() {
    
  }
  func isSubscribed(completion: @escaping (Bool) -> Void) {
    Purchases.shared.getCustomerInfo { info, error in
      guard let subscriptions = info?.activeSubscriptions else { return }
     print("\n\(subscriptions)")
      completion(!subscriptions.isEmpty)
      
    }
  }
}
