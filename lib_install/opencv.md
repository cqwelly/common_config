## opencv 扩展编译

g++ line.cpp -o line -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_objdetect -lopencv_imgcodecs
export LD_LIBRARY_PATH=./lib

g++ -O3 -fPIC -shared get_line.cpp -o line.so -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_objdetect -lopencv_imgcodecs

g++ -O3 -fPIC -shared line.cpp -o line.so -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_objdetect -lopencv_imgcodecs
