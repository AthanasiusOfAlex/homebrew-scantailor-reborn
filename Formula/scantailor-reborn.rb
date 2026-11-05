class ScantailorReborn < Formula
  desc "Clean up scanned books into uniform, searchable black-and-white PDFs"
  homepage "https://github.com/AthanasiusOfAlex/ScanTailorReborn"
  url "https://github.com/AthanasiusOfAlex/ScanTailorReborn/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "4021c506f78caf9dba47e38770148afdab13ae9e2f996f1721a6c1083b14be0e"
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
