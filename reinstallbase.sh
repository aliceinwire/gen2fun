emerge glibc && \\
emerge gcc && \\
emerge baselayout coreutils binutils sysvinit && \\
locale-gen && \\
emerge system
revdep-rebuild && emerge -D world
#emerge --emptytree world
