I am doing something really stupid and somehow end up with a lot of versions packages in `/nix/store` but `sudo nix-collect-garbage -d` can't clean all of them. Instead of using the ibus-engines input-methods already have in nixpkgs, I write my own one then delete my own pkgs and switch back between nixpkgs stable, unstable and my own pkgs, it end up like that. I don't how and what should I do next to remove them completely.

```
5z90mndkq2fsfv8lf5d42alckdirvyy1-ibus-bamboo-0.8.2-rc18
8hivqfxr6kszkqlf1nmb8xrcxy83w8hc-ibus-bamboo-0.8.4-rc6
r1is6i5xzqcpgzax9x1xcaxd00kvmjv8-ibus-bamboo-0.8.2-rc18
```

Here is my previous config.

```nix
let
  mybamboo = pkgs.callPackage ../pkgs/ibus-bamboo.nix{};
in
{
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = [
      mybamboo
    ];
  };
}
```

Switching to stable

```nix
{
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      bamboo
    ];
  };
}
```
