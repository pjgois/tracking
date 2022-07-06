FROM rikorose/gcc-cmake:latest
RUN mkdir /v2xframework
WORKDIR /v2xframework
COPY cmake ./cmake/
COPY libs ./libs/
COPY v2xframework ./v2xframework/
COPY CMakeLists.txt ./
RUN mkdir build
WORKDIR /v2xframework/build
COPY runtests.sh ./
RUN cmake ..
RUN cmake --build /v2xframework/build/ --config Debug --target all -j 10 --
ENTRYPOINT ["./runtests.sh"]
