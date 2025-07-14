//
//  ContentView.swift
//  StringCalculator
//
//  Created by Aniket Rao on 10/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @State private var result: String = ""
    @State private var errorMessage: String?

    let calculator = StringCalculator()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter numbers (e.g., 1,2,3)", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Calculate Sum") {
                    calculate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                } else {
                    Text("Result: \(result)")
                        .font(.title)
                        .bold()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("String Calculator")
        }
    }

    private func calculate() {
        do {
            let sum = try calculator.add(input)
            result = "\(sum)"
            errorMessage = nil
        } catch {
            result = ""
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}

import Foundation

enum StringCalculatorError: Error, LocalizedError {
    case negativeNumbersNotAllowed([Int])

    var errorDescription: String? {
        switch self {
        case .negativeNumbersNotAllowed(let numbers):
            return "Negative numbers not allowed: \(numbers.map { String($0) }.joined(separator: ", "))"
        }
    }
}

class StringCalculator {
    func add(_ numbers: String) throws -> Int {
        if numbers.isEmpty {
            return 0
        }

        var delimiters = [",", "\n"]
        var numbersString = numbers

        if numbers.hasPrefix("//") {
            let parts = numbers.split(separator: "\n", maxSplits: 1).map(String.init)
            if parts.count == 2 {
                let customDelimiter = parts[0].dropFirst(2)
                delimiters.append(String(customDelimiter))
                numbersString = parts[1]
            }
        }

        let pattern = delimiters
            .map { NSRegularExpression.escapedPattern(for: $0) }
            .joined(separator: "|")

        let regex = try NSRegularExpression(pattern: pattern)

        let tokens = numbersString.components(separatedBy: regex)

        let intValues = tokens.compactMap { Int($0) }

        let negativeNumbers = intValues.filter { $0 < 0 }
        if !negativeNumbers.isEmpty {
            throw StringCalculatorError.negativeNumbersNotAllowed(negativeNumbers)
        }

        return intValues.reduce(0, +)
    }
}


private extension String {
    func components(separatedBy regex: NSRegularExpression) -> [String] {
        let nsString = self as NSString
        let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
        var lastIndex = 0
        var parts: [String] = []

        for result in results {
            let range = result.range
            let part = nsString.substring(with: NSRange(location: lastIndex, length: range.location - lastIndex))
            parts.append(part)
            lastIndex = range.location + range.length
        }

        if lastIndex < nsString.length {
            parts.append(nsString.substring(from: lastIndex))
        }

        return parts
    }
}
