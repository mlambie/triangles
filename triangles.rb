require 'triangle_pattern'
require 'mini_magick'

pattern = TrianglePattern.generate(
  # colors: ['', '', '', '', ''],
  colors: ['#408AFF', '#3AE89A', '#C7FF4D', '#E8B33A', '#FF4F29'],
  width: 2400,
  height: 600,
  cell_size: 45,
  variance: 0.80,
  seed: rand(1337)
)

name = File.basename(__FILE__, '.rb')
File.open("#{name}.svg", 'w') { |f| f.write(pattern.to_svg) }

MiniMagick::Image.open("#{name}.svg").format("png").write("#{name}.png")
