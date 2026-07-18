{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    llvmPackages.llvm
    llvmPackages.clang
    cmake
    gnumake
  ];
}
