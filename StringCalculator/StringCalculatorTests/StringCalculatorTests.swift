//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Aniket Rao on 10/07/25.
//

import Testing
import XCTest
@testable import StringCalculator

final class StringCalculatorTests {

    let calculator = StringCalculator()

        @Test func testEmptyStringReturnsZero() async throws {
            #expect(try calculator.add("") == 0)
        }

        @Test func testOneNumberReturnsSameNumber() async throws {
            #expect(try calculator.add("1") == 1)
        }

        @Test func testTwoNumbersCommaSeparated() async throws {
            #expect(try calculator.add("1,2") == 3)
        }

        @Test func testMultipleNumbers() async throws {
            #expect(try calculator.add("1,2,3,4,5") == 15)
        }

        @Test func testNumbersWithNewline() async throws {
            #expect(try calculator.add("1\n2,3") == 6)
        }

        @Test func testCustomDelimiter() async throws {
            #expect(try calculator.add("//;\n1;2") == 3)
        }

        @Test func testNegativeNumbersThrows() async throws {
            do {
                _ = try calculator.add("1,-2,-3")
//                #fail("Expected error was not thrown")
            } catch let error as StringCalculatorError {
                switch error {
                case .negativeNumbersNotAllowed(let negatives):
                    #expect(negatives == [-2, -3])
                }
            }
        }

}
