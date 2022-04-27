class Pokemonsay < Formula
  desc 'pokemonsay, like cowsay but for Pokémon'
  homepage "https://github.com/AnthonyVadala/pokemonsay"
  url "https://github.com/AnthonyVadala/pokemonsay/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "608a3e0374f930e5e93760c5bf384ad63acd3e7e0b2a9f5c8539853225729677"
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
