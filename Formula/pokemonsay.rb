class Pokemonsay < Formula
  desc 'pokemonsay, like cowsay but for Pokémon'
  homepage "https://github.com/AnthonyVadala/pokemonsay"
  url "https://github.com/AnthonyVadala/pokemonsay/archive/refs/tags/v.1.9.0.tar.gz"
  sha256 "e0a1f5b5d6c02ccff1fafe890448cc5c8109697ac03b88c654b0524d89c38ac4"
  version "v1.9.0"

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
