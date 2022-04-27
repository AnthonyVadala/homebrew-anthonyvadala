class Pokemonsay < Formula
  desc 'pokemonsay, like cowsay but for Pokémon'
  homepage "https://github.com/AnthonyVadala/pokemonsay"
  url "https://github.com/AnthonyVadala/pokemonsay/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f642540a38c6f01686703b9b06445f3c6eeb3a96960a8163e1ef2e1f1e99b734"
  version "v1.0.0"

  depends_on "cowsay" => :recommended
  depends_on "coreutils" => [:recommended, "with-default-names"] if not OS.linux?

  def install
    system "cp", "-r", "./cows", "#{prefix}/cows"
    system "cp", "pokemonsay.sh", "pokemonsay"
    system "cp", "pokemonthink.sh", "pokemonthink"

    inreplace "pokemonsay", /^pokemon_path=.*$/, "pokemon_path=#{prefix}/cows"
    # inreplace "pokemonsay", /\bshuf\b/, "gshuf" if not OS.linux?

    bin.install "pokemonsay"
    bin.install "pokemonthink"
  end

  test do
    system "false"
  end
end
