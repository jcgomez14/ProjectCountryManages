import XCTest
@testable import CountryManages

final class UserDefaultManagerTest: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
 
    }
    
    func testSaveUserDefault() {
        let key = "testKey"
        let value = "testValue"
        
        UserDefaultManager.shared.saveData(value, forKey: key)
        let retrievedValue = UserDefaultManager.shared.retrieveData(forKey: key)
        
        XCTAssertEqual(retrievedValue, value, "Error, la informacion alamacenada no coincide con la recuperada")
    }


}
