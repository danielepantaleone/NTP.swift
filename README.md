![](https://github.com/danielepantaleone/NTP.swift/blob/master/Banner.png?raw=true)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdanielepantaleone%2FNTP.swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/danielepantaleone/NTP.swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdanielepantaleone%2FNTP.swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/danielepantaleone/NTP.swift)
![Cocoapods Version](https://img.shields.io/cocoapods/v/NTP)
![GitHub Release](https://img.shields.io/github/v/release/danielepantaleone/NTP.swift)
![GitHub License](https://img.shields.io/github/license/danielepantaleone/NTP.swift)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/danielepantaleone/NTP.swift/swift-build.yml)

NTP.swift is a Swift library that queries NTP (Network Time Protocol) servers to obtain the accurate current date and time. 
It provides a simple and efficient way to synchronize system time with reliable NTP sources, ensuring precise timekeeping for applications that require accurate timestamps.

## Table of contents

* [Feature highlights](#feature-highlights)
* [Usage](#usage)
* [Installation](#installation)
    * [Cocoapods](#cocoapods)
    * [Swift package manager](#swift-package-manager)
* [Contributing](#contributing)
* [License](#license)

## Feature Highlights

- [x] Supports both iOS and macOS.
- [x] Perform NTP requests using the provided `NtpClient`
- [x] Perform asynchronous NTP server query using callbacks or swift concurrency 

## Usage

```swift
do {
    let ntp = NtpClient(timeoutIntervalForRequest: 10)
    let date = try await ntp.request(URL(string: "ntp://time.apple.com")!)
} catch {
    print("Failed to perform NTP request: \(error)")
}
```

## Installation

### Cocoapods

```ruby
pod 'NTP', '~> 1.2.1'
```

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/danielepantaleone/NTP.swift.git", .upToNextMajor(from: "1.2.0"))
]
```

## Contributing

If you like this project, you can contribute by:

- Submitting a bug report via an [issue](https://github.com/danielepantaleone/NTP.swift/issues)
- Contributing code through a [pull request](https://github.com/danielepantaleone/NTP.swift/pulls)

## License

```
MIT License

Copyright (c) 2025 Daniele Pantaleone

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
