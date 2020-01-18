{
  pkgs ? import <nixpkgs> {},
  ...
}:

with pkgs;
stdenv.mkDerivation rec {
  name = "MiKTeX";
  majorMinorVersion = "2.9";
  version = "${majorMinorVersion}.7250";

  ctan = "http://ctan.org/tex-archive/systems/win32/miktex/tm/packages/";

  # Shouldn't these just be included in the source tarball?
  # See also: the note on postUnpack
  bootstrappingSrcs = map fetchurl [
    {
      url = "${ctan}miktex-zzdb1-${majorMinorVersion}.tar.lzma";
      sha512 = "23zrz3cy8by6vkdzdq1li545lpgrv3f1h4p288f70q1qs60m4qp5z5wn8jmrmmv5zac77wf78mb8g1mn5rj3b94fgsxwxvk6aqbiqrh";
    }
    {
      url = "${ctan}miktex-zzdb3-${majorMinorVersion}.tar.lzma";
      sha512 = "32np2i0cz5416r8l0z96mlpcrgsgzna1r8ssixsmiicakkf8bd77k5fghcxvh2fijjxyy64v8mlb6hzzw9j04vx5ayhizhay3fkg0zi";
    }
    {
      url = "${ctan}miktex-config-${majorMinorVersion}.tar.lzma";
      sha512 = "2pj7yxybb2471hwijilq71dcklf1f8j1ycbaaffazp9vypxwp9yk9lrfvj802fc7ybig9jlymjcgw7731brr9hpzvjn8lybf043iwn1";
    }
    {
      url = "${ctan}miktex-dvips.tar.lzma";
      sha512 = "3z110cx8mmz2gbp3bs50lcs2v2ysw66f86ms618xvv8rp52pksn1pw71mp8jinlywp6dl4xz9bxl3bb68zaadrnnv1zcz998rjbkf0q";
    }
    {
      url = "${ctan}miktex-fontconfig.tar.lzma";
      sha512 = "03pvcnhhpnf2yq6j8k4r9i5wxih4z9l67flw377rk21zw47b3wz5d5m2gkdnpaqbqqw90y42yipzr0wz8wlmb2mia59f49y493pfrzw";
    }
    {
      url = "${ctan}miktex-misc.tar.lzma";
      sha512 = "255fl1n4mqh5xs715jczqchln7z42da2flpx0sf9wmk01bkp1689spc8bwm17hm3cqbw87f0566v6ah13k3l6gkz3bhc3gfw4ainidh";
    }
    {
      url = "${ctan}tetex.tar.lzma";
      sha512 = "28qmgbd2dy1rfrwvp9d5mkcaph88d5rb5cw1qifmfdv6zs06j62n5avpcnsq5d35hvi97v44izi3wbwd57sqy83bdjnhvc8qmgh878h";
    }
  ];

  src = fetchurl {
    url = "https://miktex.org/download/ctan/systems/win32/miktex/source/miktex-${version}.tar.xz";
    sha512 = "2fqd0zp5fv8g03pij7fvbib6dpd4ng04ciijpk6fdc156p6hdvxm42f9cg87dkmbf5ikv478078w42dcvj6k1yily4fb3355kx1f68m";
  };

  # MiKTeX's CMake script curls these files while building; that won't do, so we
  # put them in a predictable place and patch CMakeLists.txt; see
  # ./curl-zzdb1-and-zzdb3.patch.
  postUnpack =
    ''
      for file in $bootstrappingSrcs
      do
        cp "$file" "$(stripHash "$file")"
      done
    '';

  patches = [
    ./patches/autosp-fprintf-security.patch
    ./patches/curl-zzdb1-and-zzdb3.patch
    ./patches/cfg-ld_library_path.patch
    ./patches/findtexmf-ld_library_path.patch
    ./patches/mpc-link-extractor.patch
  ];

  cmakeFlags = [
    "-DWITH_UI_QT=ON"
    "-DMIKTEX_SELF_CONTAINED=TRUE"
  ];

  buildInputs = [
    cmake
    pkg-config
    apr
    aprutil
    bison
    bzip2
    cairo
    curl
    expat
    flex
    fontconfig
    freetype # freetype2
    fribidi
    gd
    gmp
    graphite2
    harfbuzzFull # harfbuzz-icu
    hunspell
    icu
    libjpeg
    libxslt
    log4cxx
    lzma
    mpfr
    libmspack
    openssl
    pixman
    libpng
    poppler
    poppler_qt5
    popt
    potrace
    qt5.full
    uriparser
    zziplib
  ];

  postInstall =
    ''
    "$out/bin/mpm" --admin --verbose --package-level=basic --upgrade
    "$out/bin/mpm" --admin --verbose --update-db
    "$out/bin/initexmf" --admin --verbose --set-config-value [MPM]AutoInstall=1
    "$out/bin/initexmf" --admin --verbose --update-fndb
    "$out/bin/initexmf" --admin --verbose --mkmaps
    "$out/bin/initexmf" --admin --verbose --mklinks
    '';
}
