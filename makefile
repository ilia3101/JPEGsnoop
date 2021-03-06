CC=g++
CFLAGS=-c -fPIC

main: WindowBuf.o JfifDecode.o DocLog.o snoop.o DbSigs.o ImgDecode.o General.o
	ar rcs libsnoop.a *.o
	$(CC) -shared *.o -o libsnoop.so
	$(CC) $(CFLAGS) -DSNOOP_TEST snoop.cpp
	$(CC) *.o -o runsnoop

snoop.o: snoop.cpp snoop.h
	$(CC) $(CFLAGS) snoop.cpp

JfifDecode.o: source/JfifDecode.cpp source/JfifDecode.h source/DocLog.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/JfifDecode.cpp

DocLog.o: source/DocLog.cpp source/DocLog.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/DocLog.cpp

WindowBuf.o: source/WindowBuf.cpp source/WindowBuf.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/WindowBuf.cpp

DbSigs.o: source/DbSigs.cpp source/DbSigs.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/DbSigs.cpp

ImgDecode.o: source/ImgDecode.cpp source/ImgDecode.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/ImgDecode.cpp

General.o: source/General.cpp source/General.h source/WindowsClasses.h
	$(CC) $(CFLAGS) source/General.cpp

clean:
	rm *.o runsnoop