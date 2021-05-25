{ lib, stdenv, buildGoModule, zfs }:
buildGoModule rec {
  pname = "docker-zfs-plugin";
  version = "2.0.0";

  src = lib.cleanSource ./.;

  buildInputs = [ zfs ];

  CGO_CFLAGS = "-I${zfs.dev}/include/libzfs -I${zfs.dev}/include/libspl";
  CGO_LDFLAGS = "-L${zfs.out}/lib";

  vendorSha256 = "0sxcgw1hr7skl3x5jzzk8k3pcd99f2q3cycvqcakvbbrr3mxz35d";
  subPackages = [ "." ];
}
