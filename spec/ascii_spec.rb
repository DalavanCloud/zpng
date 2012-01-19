require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

ASCII_QR = <<EOF
...................................
.#######.##.....##.#.##....#######.
.#.....#.......##.#.##.....#.....#.
.#.###.#.#..#####..#.#..##.#.###.#.
.#.###.#.##.#....#.####.##.#.###.#.
.#.###.#.####.#....#.####..#.###.#.
.#.....#..#..#.#..#####....#.....#.
.#######.#.#.#.#.#.#.#.#.#.#######.
..........#.#.##.....##.##.........
.####..#.#....##.#.##....##..###.#.
..#.##...##.....##.#.##.#.###...##.
.#.###.##......##.#.##..##.#.###.#.
....###.#...#####..#.#...##.#...#..
.##.##.#..#.#....#.####..##.##.....
...#..#.##.##.#....#.###.##....##..
.#.######.##.#.#..#####..#######...
.#.####..###.##.#.##....#...##.#...
...##.##..###.....##.#.##.########.
.....#..###..##.....##.#########.#.
.####.#####.##.....##.#...#...#.#..
..##.#..#..#.#..#####..#.#..##...#.
...######.#####.#....#.##......#...
..###.....#..####.#....###.#...###.
.###..####.####..#.#..#######...##.
.#.#.##.##.#.....##.#.##.######.#..
..#.#######..#.##.....##.#####...#.
.........#.###.#.##.....##...#.#...
.#######....#.#.##.....###.#.#.....
.#.....#..###..#.#..######...###.#.
.#.###.#.....#.####.#...########...
.#.###.#.###...#.####.#.#.#........
.#.###.#.###..#####..#.##..#..#....
.#.....#.####.##.....##.###......#.
.#######.#.#..##.#.##...#.##...#...
...................................
EOF

describe "ZPNG png2ascii" do
  it "should have QR examples" do
    Dir[File.join(SAMPLES_DIR,'qr_*.png')].should_not be_empty
  end
  Dir[File.join(SAMPLES_DIR,'qr_*.png')].each do |fname|
    describe fname do
      it "generates a nice ascii img" do
        ZPNG::Image.new(fname).to_s(:white => '.', :black => '#').strip.should == ASCII_QR.strip
      end
    end
  end
end
