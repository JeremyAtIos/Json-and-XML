# json
###json、xml数据解析</br>
##1.json</br>
现在可以直接使用苹果原生对象NSJsonSerialization解析了,许多第三方json解析框架都停止维护了，应该是原生API性能足够好了。</br>
##2.xml</br>
（1）SAX:逐行解析，可随时暂停，NSXMLParser。</br>
（2）DOM:文档解析，直接解析整个文档。</br>
