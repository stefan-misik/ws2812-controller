


.PHONY: all clean prog-eep

all: eeprom_settings.eep

clean:
	$(RM) *.dtbo *.eep

prog-eep: eeprom_settings.eep
	sudo eepflash.sh -w -f=$< -t=24c256 -d=0

eeprom_settings.eep: eeprom_settings.txt dt.dtbo
	eepmake $< $@ dt.dtbo

%.dtbo: %-overlay.dts
	dtc -@ -Hepapr -I dts -O dtb -o $@ $<

