class Foma < Formula
  desc "Finite-state compiler and C library"
  homepage "https://github.com/mhulden/foma"
  license "GPL-2.0-only"
  head "https://github.com/mhulden/foma.git"

  depends_on "cmake" => :build
  uses_from_macos "flex" => :build
  uses_from_macos "zlib"

  on_linux do
    depends_on "readline"
  end

  conflicts_with "freeling", because: "freeling ships its own copy of foma"

  def install
    chdir "foma" do
      system "cmake", "CMakeLists.txt"
      system "make", "-j3"
      system "make", "install"
    end
    #system "cmake", "-S", "./foma", "-B", "build", *std_cmake_args
    #system "cmake", "--build", "build"
    #system "cmake", "--install", "build"
  end

end
