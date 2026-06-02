class Invoicegen < Formula
  desc "Local-first invoice management CLI"
  homepage "https://github.com/megabyte0x/invoicegen"
  url "https://github.com/megabyte0x/invoicegen/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "22d81ecdfff11f1a51ec2a316f04d03b9f46b890270163e7c44e3194c559c399"
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
