# uPyJupyter
Dockerfile: Jupyter with custom added Kernel for ESP32/ESP8266


## Running the Container
```
# e.g. on Linux
docker run -p 8888:8888 --privileged --device=/dev/ttyUSB0 -it lemariva/upyjupyter
```

## More Info
[MicroPython: Programming an ESP using Jupyter Notebook](https://lemariva.com/blog/2019/01/micropython-programming-an-esp-using-jupyter-notebook)