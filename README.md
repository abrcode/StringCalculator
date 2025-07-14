<!DOCTYPE html>
<html lang="en">
<body>
  <h1>📐 String Calculator TDD Kata (SwiftUI)</h1>
  <p>This is a simple iOS <strong>String Calculator</strong> app built in <strong>Swift</strong> using <strong>SwiftUI</strong> and <strong>Test-Driven Development (TDD)</strong>.</p>

  <h2>🚀 What It Does</h2>
  <ul>
    <li>✅ Takes a string of numbers separated by <strong>commas</strong>, <strong>new lines</strong>, or <strong>custom delimiters</strong></li>
    <li>✅ Calculates the <strong>sum</strong> of the numbers</li>
    <li>✅ Shows the result instantly in a clean UI</li>
    <li>✅ Handles any number of inputs</li>
    <li>✅ Supports custom delimiters using the <code>//[delimiter]\n[numbers]</code> syntax</li>
    <li>✅ Detects <strong>negative numbers</strong> and throws a clear error showing all negative values</li>
  </ul>

  <h2>📱 How It Works</h2>
  <p>1. Enter a string like:</p>
  <pre>1,2,3</pre>
  <p>2. Or use new lines:</p>
  <pre>1\n2,3</pre>
  <p>3. Or define a custom delimiter:</p>
  <pre>//;\n1;2;3</pre>
  <p>4. Tap <strong>Calculate</strong> → see the sum instantly.</p>
  <p>If there are negative numbers, the app will display an error listing them all.</p>

  <h2>✅ Built With</h2>
  <ul>
    <li><strong>Swift 5</strong></li>
    <li><strong>SwiftUI</strong> for a modern, declarative UI</li>
    <li><strong>XCTest</strong> for full TDD coverage</li>
  </ul>

  <h2>🧪 TDD Approach</h2>
  <p>This app follows the <strong>Test-Driven Development (TDD)</strong> process:</p>
  <ol>
    <li>Write the smallest failing test.</li>
    <li>Implement the minimum code to pass the test.</li>
    <li>Refactor to keep the code clean.</li>
    <li>Repeat until all requirements are covered.</li>
  </ol>
  <p>The included unit tests cover:</p>
  <ul>
    <li>Empty string → returns <code>0</code></li>
    <li>Single number → returns that number</li>
    <li>Multiple numbers → sums correctly</li>
    <li>Newline separators</li>
    <li>Custom delimiters</li>
    <li>Negative number validation</li>
  </ul>

  <h2>📂 How to Run</h2>
  <ol>
    <li>Clone the repo:<br>
      <pre>git clone https://github.com/yourusername/StringCalculatorSwiftUI.git</pre>
    </li>
    <li>Open the <code>.xcodeproj</code> or <code>.xcodeworkspace</code> in <strong>Xcode</strong>.</li>
    <li>Run the app on the simulator or your device.</li>
    <li>To run tests:<br>
      <pre>⌘ + U</pre>
    </li>
  </ol>

  <h2>✨ Screenshots</h2>
  <table>
    <tr>
      <th>Input</th>
      <th>Result</th>
    </tr>
    <tr>
      <td><img src="#" alt="Input Screenshot"></td>
      <td><img src="#" alt="Result Screenshot"></td>
    </tr>
  </table>
  <p><em>(Add screenshots when ready)</em></p>

  <h2>📜 License</h2>
  <p>This project is open source and free to use for learning purposes.</p>

  <h2>🙌 Credits</h2>
  <p>This app is inspired by the classic <strong>String Calculator Kata</strong> by Roy Osherove — a popular exercise for practicing TDD in any language.</p>

  <p><strong>Happy Calculating! 🚀</strong></p>
</body>
</html>
