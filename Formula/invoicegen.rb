class Invoicegen < Formula
  desc "Local-first invoice generation CLI"
  homepage "https://invoicegen.megabyte.sh/cli"
  url "https://github.com/megabyte0x/invoicegen/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "fa6860f810e6538b3d8b31e2a81abbeaf61cbcd4b80fc8e9b773744281bfe1ec"
  license "Apache-2.0"
  head "https://github.com/megabyte0x/invoicegen.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
    bin.install_symlink bin/"invoicegen-rs" => "invoicegen"
  end

  test do
    assert_match "InvoiceGen", shell_output("#{bin}/invoicegen --help")
  end
end
