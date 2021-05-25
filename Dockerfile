FROM centos

RUN mkdir /usr/local/java
ADD jdk-8u271-linux-x64.tar.gz /usr/local/java/

RUN ln -s /usr/local/java/jdk1.8.0_271 /usr/local/java/jdk

ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

ENV LANG C.UTF-8

WORKDIR /app
COPY ./config/config.xml /app
COPY ccb-cloud-sdk-1.0-SNAPSHOT.jar /app
COPY ./config/MC123456789.pfx /app

CMD [ "java","-jar" ,"./ccb-cloud-sdk-1.0-SNAPSHOT.jar" ]

EXPOSE 8080