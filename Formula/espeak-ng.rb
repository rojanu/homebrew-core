class EspeakNg < Formula
  desc "Text to speech, software speech synthesizer"
  homepage "https://github.com/espeak-ng/espeak-ng"
  url "https://github.com/espeak-ng/espeak-ng/archive/1.49.2.tar.gz"
  sha256 "a2ac11ee20130388f58c829b10dfba7f496e83e89ebe5460d1bae06a36a1c5be"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "portaudio"
  depends_on "pulseaudio"

  def install
    ENV.deparallelize
    share.install "espeak-ng-data"
    doc.install Dir["docs/*"]
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/espeak", "This is a test for Espeak.", "-w", "out.wav"
  end
end
