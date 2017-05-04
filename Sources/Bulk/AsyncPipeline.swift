//
// AsyncPipeline.swift
//
// Copyright (c) 2017 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import Dispatch

public final class AsyncPipeline: Pipeline {
  
  public let queue: DispatchQueue
  
  public init(plugins: [Plugin], formatter: Formatter, bulkBuffer: Buffer = NoBuffer(), writeBuffer: Buffer = NoBuffer(), target: Target, queue: DispatchQueue) {
    self.queue = queue
    super.init(plugins: plugins, formatter: formatter, bulkBuffer: bulkBuffer, writeBuffer: writeBuffer, target: target)
  }
  
  override func write(log: Log) {
    
    queue.async {
      super.write(log: log)
    }
  }
  
  override func loadBuffer() {
    
    queue.async {
      super.loadBuffer()
    }
  }
}