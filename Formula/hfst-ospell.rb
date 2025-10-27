class HfstOspell < Formula
  desc "HFST spell checker library and command line tool"
  homepage "https://hfst.github.io/"
  url "https://github.com/hfst/hfst-ospell.git",
      tag:   "v0.5.4",
      revision: "85edd77e959df213d2e713cbd3ca0ff9a600f462"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "libarchive"  
  depends_on "libxml++" 

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          *std_configure_args()
    system "make", "install"
  end

end
