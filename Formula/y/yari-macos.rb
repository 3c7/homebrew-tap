class YariMacos < Formula
  desc "YARI is an interactive debugger for YARA Language"
  homepage "https://avast.github.io/yls/"
  url "https://github.com/avast/yari/archive/65ab2d755331ce99af73a0c4882da92260b87822.tar.gz"
  version "0.1.6"
  sha256 "1c19291b2957615dc50b41ddc7fb00b9ad6624c179bff2b5b92bb6d1afe8d1a8"
  license all_of: ["MIT", "BSD-3-Clause"]
  head "https://github.com/avast/yari", branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "maturin" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "jansson"
  depends_on "libmagic"
  depends_on "openssl@3"
  depends_on "protobuf-c"

  def install
    system "git", "clone", "--depth=1", "-b", "v4.2.3", "https://github.com/virustotal/yara.git", "yari-sys/yara"
    system "make", "target/release/yari"
    bin.install "target/release/yari"
  end
end
