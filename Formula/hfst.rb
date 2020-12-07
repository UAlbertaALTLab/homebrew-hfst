class Hfst < Formula
  desc "Helsinki Finite-State Technology (library and application suite)"
  homepage "https://hfst.github.io/"
  url "https://github.com/hfst/hfst/releases/download/v3.15.2/hfst-3.15.2.tar.gz"
  sha256 "7e28c6aa2796549b93f5e8aee7ca187716df17b9e687718d4ebf9817d214059d"

  depends_on "readline" => :recommended

  def install
    readline = if build.with?("readline")
              ['--with-readline']
               else
              ['--without-readline']
               end
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          *readline,
                          "--prefix=#{prefix}"
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
