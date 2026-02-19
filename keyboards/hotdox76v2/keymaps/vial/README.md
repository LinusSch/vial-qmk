# Vial port for Hot Dox v2

The JSON was copied from
https://github.com/the-via/keyboards/blob/master/src/hotdox76v2/hotdox76v2.json
and had the 3 vial-ignored lines removed and the "lighting" line moved to follow
the example in the
[vial porting guide - Create JSON](https://get.vial.today/docs/porting-to-via.html).
This JSON file has been dummy loaded in Vial 0.7.5 with no apparent problems.

Steps 1 through 6 of the
[second page - Port to Vial](https://get.vial.today/docs/porting-to-vial.html)
have been faithfully followed. The keymap.c file in this folder is for now
identical to the one in the default keymap for hotdox76v2 in this repository.

The default of 4 keymap layers did not fit in EEPROM, so it has been reduced to 3.
(I intend to experiment with removing something else instead, e.g. lighting effects,
at a later date - first I want something that works at all.)

The firmware does not fit in the limited space:
   Linking: .build/hotdox76v2_vial.elf                                                                 [ERRORS]
 | 
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: .build/hotdox76v2_vial.elf section `.text' will not fit in region `text'
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: address 0x800ba1 of .build/hotdox76v2_vial.elf section `.bss' is not within region `data'
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: address 0x800ba5 of .build/hotdox76v2_vial.elf section `.noinit' is not within region `data'
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: address 0x800ba1 of .build/hotdox76v2_vial.elf section `.bss' is not within region `data'
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: address 0x800ba5 of .build/hotdox76v2_vial.elf section `.noinit' is not within region `data'
 | /usr/lib/gcc/avr/5.4.0/../../../avr/bin/ld: region `text' overflowed by 12376 bytes
 | collect2: error: ld returned 1 exit status
 
Setting the option
    LTO_ENABLE = yes
in rules.mk surprisingly and disappointingly makes no difference whatsoever, still 12376 bytes over.
