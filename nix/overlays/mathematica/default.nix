# This file is automatically generated by './update.sh'.
# Do not manually edit it!
self: super: {
  mathematica = super.mathematica.overrideAttrs (old: rec {
    version = "12.1.1";
    name = "mathematica-${version}";

    src = super.requireFile rec {
      name = "Mathematica_${version}_LINUX.sh";
      sha256 = "02mk8gmv8idnakva1nc7r7mx8ld02lk7jgsj1zbn962aps3bhixd";
      url = "https://user.wolfram.com/portal/myProducts.html";
    };
  });
}
