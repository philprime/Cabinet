import XCTest
@testable import CabinetPropertyWrappers

class UserDefaultTests: XCTestCase {

    func testInitializer_canBeInitializedWithoutStorageParameter() {
        class TestObject {
            @UserDefault("testInitializer_canBeInitializedWithoutStorageParameter", defaultValue: "") var value: String
        }
        _ = TestObject()
    }

    func testInitializer_canBeInitializedWithCustomStorageParameter() {
        class TestObject {
            static let storage = UserDefaults(suiteName: "testInitializer_canBeInitializedWithCustomStorageParameter")!
            @UserDefault("testInitializer_canBeInitializedWithoutStorageParameter", defaultValue: "", storage: TestObject.storage) var value: String
        }
        let object = TestObject()
        object.value = "my value"
        XCTAssertEqual(TestObject.storage.string(forKey: "testInitializer_canBeInitializedWithoutStorageParameter"), "my value")
    }

    func testSetter_defaultStorage_shouldStoreInDefaults() {
        class TestObject {
            @UserDefault("testInitialiser_noStorageParameterSet_shouldUseStandard", defaultValue: "") var value: String
        }
        let object = TestObject()
        object.value = "my value"
        XCTAssertEqual(UserDefaults.standard.string(forKey: "testInitialiser_noStorageParameterSet_shouldUseStandard"), "my value")
        UserDefaults.standard.removeObject(forKey: "testInitialiser_noStorageParameterSet_shouldUseStandard")
    }

    func testSetter_valueIsNil_shouldBeRemoved() {
        class TestObject {
            static let storage = UserDefaults(suiteName: "testSetter_valueIsNil_shouldBeRemoved")!
            @UserDefault("testSetter_valueIsNil_shouldBeRemoved", defaultValue: nil, storage: TestObject.storage) var value: String?
        }
        let key = "testSetter_valueIsNil_shouldBeRemoved"
        TestObject.storage.setValue("old value", forKey: key)
        let object = TestObject()
        XCTAssertEqual(TestObject.storage.string(forKey: key), "old value")
        object.value = nil
        XCTAssertNil(object.value)
        XCTAssertNil(TestObject.storage.string(forKey: key))
    }
}
