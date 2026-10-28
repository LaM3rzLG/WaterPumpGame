// epmontage <kimenet.png> <oszlopok> <szelesseg/kep> <kep1.png> [kep2.png ...] : kontaktlap (sorszammal)
import Foundation
import CoreGraphics
import ImageIO
import UniformTypeIdentifiers
import AppKit
let a = CommandLine.arguments
let out = a[1], cols = Int(a[2])!, cw = Int(a[3])!
let files = Array(a[4...])
var imgs: [CGImage] = []
for f in files {
  if let s = CGImageSourceCreateWithURL(URL(fileURLWithPath: f) as CFURL, nil),
     let i = CGImageSourceCreateImageAtIndex(s, 0, nil) { imgs.append(i) }
}
guard let first = imgs.first else { exit(1) }
let ch = cw * first.height / first.width, gap = 4
let rows = (imgs.count + cols - 1) / cols
let W = cols * (cw + gap) + gap, H = rows * (ch + gap) + gap
let ctx = CGContext(data: nil, width: W, height: H, bitsPerComponent: 8, bytesPerRow: 0,
                    space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
ctx.setFillColor(CGColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)); ctx.fill(CGRect(x: 0, y: 0, width: W, height: H))
ctx.interpolationQuality = .none
NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false)
for (n, i) in imgs.enumerated() {
  let x = gap + (n % cols) * (cw + gap), y = H - (gap + (n / cols + 1) * (ch + gap)) + gap
  ctx.draw(i, in: CGRect(x: x, y: y, width: cw, height: ch))
  let t = NSAttributedString(string: " \(n + 1) ", attributes: [.font: NSFont.boldSystemFont(ofSize: 14),
          .foregroundColor: NSColor.white, .backgroundColor: NSColor.red])
  t.draw(at: CGPoint(x: x + 3, y: y + ch - 20))
}
let d = CGImageDestinationCreateWithURL(URL(fileURLWithPath: out) as CFURL, UTType.png.identifier as CFString, 1, nil)!
CGImageDestinationAddImage(d, ctx.makeImage()!, nil); CGImageDestinationFinalize(d)
