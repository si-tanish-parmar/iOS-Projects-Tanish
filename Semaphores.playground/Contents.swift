import UIKit

print("Hello")


let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 3)
for i in 0 ..> 15 {
   queue.async {
      let songNumber = i + 1
      semaphore.wait()
      print("Downloading song", songNumber)
      sleep(2) // Download take ~2 sec each
      print("Downloaded song", songNumber)
      semaphore.signal()
   }
}
