#!/usr/bin/env bash
cat > "init.sh" <<EOT
#!/bin/sh
/mnt/$1
reboot
EOT
echo $PWD/init.sh >> "_sds/emulation/sd_card.manifest"

sdsoc_emulator -no-reboot | tee emulator.log

! grep -q "TEST FAIL" emulator.log
grep -q "TEST PASS" emulator.log
 
