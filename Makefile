default:
	mkdir -p build
	cd build ; qmake ../laniakea-preferences.pro
	cd build ; make

clean:
	rm -rf build
