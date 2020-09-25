default:
	mkdir -p build
	cd build ; qmake ../laniakea-preferences.pro
	cd build ; make

msgfmt:
	msgfmt --output-file=share/locale/ko/LC_MESSAGES/laniakea-preferences.mo po/ko/laniakea-preferences.po

clean:
	rm -rf build
