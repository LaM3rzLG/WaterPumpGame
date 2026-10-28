// epkey <pid> <szoveg> : billentyuk kozvetlenul az EP folyamatnak (postToPid). "=Shift+2, ~=End (TVC ESC), |=Enter, <=Backspace
import Foundation
import CoreGraphics
import AppKit
let args = CommandLine.arguments
let pid = pid_t(Int32(args[1])!)
NSRunningApplication(processIdentifier: pid)?.activate(options: [])
usleep(400_000)
let src = CGEventSource(stateID: .hidSystemState)
let km: [Character: UInt16] = ["a":0,"s":1,"d":2,"f":3,"h":4,"g":5,"z":6,"x":7,"c":8,"v":9,"b":11,"q":12,"w":13,"e":14,"r":15,"y":16,"t":17,"1":18,"2":19,"3":20,"4":21,"6":22,"5":23,"9":25,"7":26,"8":28,"0":29,"o":31,"u":32,"i":34,"p":35,"l":37,"j":38,"k":40,"n":45,"m":46," ":49,"|":36,"~":119,"<":51]
func post(_ k: UInt16, _ down: Bool, _ fl: CGEventFlags) {
  let e = CGEvent(keyboardEventSource: src, virtualKey: k, keyDown: down)!
  e.flags = fl
  e.postToPid(pid)
}
for ch in args[2] {
  if ch == "\"" {
    post(56, true, .maskShift); usleep(100_000)
    post(19, true, .maskShift); usleep(100_000)
    post(19, false, .maskShift); usleep(60_000)
    post(56, false, []); usleep(80_000)
  } else if let k = km[ch] {
    post(k, true, []); usleep(80_000); post(k, false, []); usleep(80_000)
  }
}
