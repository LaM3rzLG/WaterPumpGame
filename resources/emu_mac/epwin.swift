// epwin <pid> : az EP fo ablakanak azonositoja (screencapture -l-hez) - a legnagyobb, 0. retegu ablak
import CoreGraphics
let pid = Int(CommandLine.arguments[1])!
let l = CGWindowListCopyWindowInfo([.optionAll], kCGNullWindowID) as! [[String: Any]]
var best = 0, area = 0.0
for w in l where (w["kCGWindowOwnerPID"] as? Int) == pid && (w["kCGWindowLayer"] as? Int) == 0 {
  if let b = w["kCGWindowBounds"] as? [String: Double], let n = w["kCGWindowNumber"] as? Int {
    let a = (b["Width"] ?? 0) * (b["Height"] ?? 0); if a > area { area = a; best = n }
  }
}
print(best)
