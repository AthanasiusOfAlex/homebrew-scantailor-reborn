class ScantailorReborn < Formula
  desc "Clean up scanned books into uniform, searchable black-and-white PDFs"
  homepage "https://github.com/AthanasiusOfAlex/ScanTailorReborn"
  url "https://github.com/AthanasiusOfAlex/ScanTailorReborn/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d33a23ed44d3796ee40df103562cfdf9e1500e373e8f7418d3e153b8ce0527b6"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma
  depends_on "tesseract"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/scantailor-reborn-cli"
  end

  test do
    assert_match "scantailor-reborn-cli", shell_output("#{bin}/scantailor-reborn-cli --help")
  end
end
