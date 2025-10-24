class Hfst < Formula
  desc "Helsinki Finite-State Technology (library and application suite)"
  homepage "https://hfst.github.io/"
  url "https://github.com/hfst/hfst/releases/download/v3.16.2/hfst-3.16.2.tar.gz"
  sha256 "ce86d63dd6cb67e7b0eba161065b42b3830afb9669d076ec674d31988408c079"

  depends_on "readline" => :recommended
  depends_on "icu4c"
  depends_on "pkgconf"  
  depends_on "openfst"

  def install
    readline = if build.with?("readline")
              ['--with-readline']
               else
              ['--without-readline']
               end

    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          *readline,
                          *std_configure_args()
                      
    system "make", "install"
  end

  test do
    # Create a very simple transducer and enumerate its strings
    expected = "test\ntests\ntested\ntesting\n"
    (testpath / "test.regexp").write "test[0|s|ed|ing]"
    system (bin / "hfst-regexp2fst"), (testpath / "test.regexp"), "-o", (testpath / "test.hfst")
    assert_equal expected, shell_output("#{bin}/hfst-fst2strings #{testpath}/test.hfst")
  end
end
