echo '"thing"' > config/default.nix
nix build -L --override-input config path:./config
```
[tom@tframe:~/office/matthew/args/systemFile]$ nix build -L
warning: Git tree '/home/tom/office/matthew/args' is dirty
asdf> xxx
asdf> config is: config
asdf> xxx
error: builder for '/nix/store/w00fnnkg8pm45qf5prgp25rxxsv3jrm5-asdf.drv' failed to produce output path for output 'out' at '/nix/store/w00fnnkg8pm45qf5prgp25rxxsv3jrm5-asdf.drv.chroot/nix/store/bys6ixpinqm6w3qcnq4qj0sq81czkjas-asdf'
```
