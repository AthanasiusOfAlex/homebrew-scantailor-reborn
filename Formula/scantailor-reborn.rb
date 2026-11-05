class ScantailorReborn < Formula
  desc "Clean up scanned books into uniform, searchable black-and-white PDFs"
  homepage "https://github.com/AthanasiusOfAlex/ScanTailorReborn"
  url "https://github.com/AthanasiusOfAlex/ScanTailorReborn/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a6035304f76d8173e7c05b6a5e6835d9ad2e22288d0b8510440f270897e30f3f"
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
