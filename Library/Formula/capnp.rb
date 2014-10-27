require 'formula'

class Capnp < Formula
  homepage 'http://kentonv.github.io/capnproto/'
  url 'http://capnproto.org/capnproto-c++-0.4.1.tar.gz'
  sha1 '18ce1a404c2bf68e6625e44927bfe6b67186cb15'

  needs :cxx11
  option 'without-shared', 'Disable building shared library variant'

  def install
    args = ["--disable-debug",
            "--disable-dependency-tracking",
            "--disable-silent-rules",
            "--prefix=#{prefix}"]

    if build.without? "shared"
      args << "--disable-shared"
    end

    system "./configure", *args
    system "make", "check"
    system "make", "install"
  end

  test do
    system "#{bin}/capnp", "--version"
  end
end
