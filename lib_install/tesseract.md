tesseract 安装

sudo yum -y install g++ autoconf automake libtool autoconf-archive
sudo yum install -y pkgconfig libpng12-devel openjpeg openjpeg-devel libtiff libtiff-devel zlib zlib-devel
sudo yum install libicu* pango pango-devel cairo cairo-devel 

install leptonica
http://www.leptonica.org/source/leptonica-1.74.4.tar.gz
./configure make make install

sudo yum -y update 
sudo yum -y install libstdc++ autoconf automake libtool autoconf-archive pkg-config gcc gcc-c++ make libjpeg-devel libpng-devel libtiff-devel zlib-devel


	#Install AutoConf-Archive
	wget ftp://rpmfind.net/linux/fedora-secondary/development/rawhide/Everything/s390x/os/Packages/a/autoconf-archive-2017.03.21-2.fc27.noarch.rpm
	rpm -i autoconf-archive-2017.03.21-2.fc27.noarch.rpm


	#Install Leptonica from Source
	wget http://www.leptonica.com/source/leptonica-1.74.4.tar.gz
	tar -zxvf leptonica-1.74.4.tar.gz
	cd leptonica-1.74.4
	./autobuild
	./configure
	make
	make install
	cd ..


	#Install Tesseract from Source
	wget https://github.com/tesseract-ocr/tesseract/archive/master.zip
	unzip master.zip
	cd tesseract-master
	./autogen.sh
	PKG_CONFIG_PATH=/usr/local/lib/pkgconfig LIBLEPT_HEADERSDIR=/usr/local/include ./configure --with-extra-includes=/usr/local/include --with-extra-libraries=/usr/local/lib
	LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make -j4
	make install
	ldconfig
	cd ..

        sudo yum install libicu* pango pango-devel cairo cairo-devel 
         cd training
	#Download and install tesseract language files
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/ben.traineddata
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.traineddata
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/tha.traineddata
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/osd.traineddata
	mv *.traineddata /usr/local/share/tessdata

       
	#Download Hindi Cube data
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.bigrams
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.fold
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.lm
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.nn
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.params
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.cube.word-freq
	wget https://github.com/tesseract-ocr/tessdata/raw/3.04.00/hin.tesseract_cube.nn
	mv hin.* /usr/local/share/tessdata
