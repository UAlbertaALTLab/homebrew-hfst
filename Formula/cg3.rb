class Cg3 < Formula
desc "Tools for the 3rd edition of the Constraint Grammar formalism"
  homepage "https://edu.visl.dk/cg3.html"
  url "https://github.com/GrammarSoft/cg3/releases/download/v1.5.1/cg3-1.5.1.tar.bz2"
  sha256 "f6c286e7d871da63d73e1a2ca241b5c3ba9344fdfd25d4c9593431bd799f387d"

  depends_on "cmake" => [:build, :test]
  depends_on "boost"
  depends_on "icu4c"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args()
  end

end
