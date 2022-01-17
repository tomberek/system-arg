```
nix build --override-input systemFile "path:./systems" -L
warning: Git tree '/home/tom/office/matthew/args' is dirty
asdf> xxx
asdf> system is: x86_64-linux
asdf> description is: System as an input argument
asdf> xxx
error: builder for '/nix/store/w00fnnkg8pm45qf5prgp25rxxsv3jrm5-asdf.drv' failed to produce output path for output 'out' at '/nix/store/w00fnnkg8pm45qf5prgp25rxxsv3jrm5-asdf.drv.chroot/nix/store/bys6ixpinqm6w3qcnq4qj0sq81czkjas-asdf'
```
