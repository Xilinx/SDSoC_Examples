#!/usr/bin/env bash
cat > "init.sh" <<EOT
#!/bin/sh
/mnt/$1
reboot
EOT
echo $PWD/_sds/init.sh >> "_sds/emulation/sd_card.manifest"
mv init.sh _sds
mv *.jou _sds
mv *.log _sds
mv src/*.o _sds
sdsoc_emulator -no-reboot |tee emulator.log
 
