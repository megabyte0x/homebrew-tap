class Invoicegen < Formula
  desc "Local-first invoice management CLI"
  homepage "https://github.com/megabyte0x/invoicegen"
  url "https://github.com/megabyte0x/invoicegen/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "12c97674a02781214efed42c98059bb6cc3b58cb189217e4722562766d786101"
  license "MIT"
  head "https://github.com/megabyte0x/invoicegen.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
    bin.install_symlink bin/"invoicegen-rs" => "invoicegen"
  end

  test do
    assert_match "InvoiceGen Rust CLI", shell_output("#{bin}/invoicegen --help")
  end
end
