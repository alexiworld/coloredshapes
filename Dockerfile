# Group and My Own Schedules
#
# VERSION               1.0.0
#
# docker build -t --no-cache alexiworld/schedule .
# docker run -it -p 8080:8080 -p 3306:3306 alexiworld/schedule /bin/bash -c /schedule.sh

FROM      alexiworld/mysql
MAINTAINER Alexi Jordanov <alexiworld@yahoo.com>

RUN apt-get update 
RUN apt-get install -y \
        software-properties-common \
        python-software-properties
RUN add-apt-repository ppa:openjdk-r/ppa -y
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk   && \
    update-alternatives --config java  && \
    update-alternatives --config javac
RUN apt-get install -y \
        vim   \
        wget  \
        curl  \
        unzip \
        git

RUN mkdir /coloredshapes 
WORKDIR   /coloredshapes

RUN wget https://services.gradle.org/distributions/gradle-2.12-bin.zip
RUN unzip gradle-2.12-bin.zip
ENV PATH $PATH:/coloredshapes/gradle-2.12/bin/

RUN wget http://apache.mirror.vexxhost.com/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.zip
RUN unzip apache-tomcat-8.0.33.zip
ENV TOMCAT /coloredshapes/apache-tomcat-8.0.33
RUN chmod a+x $TOMCAT/bin/*

RUN git clone https://github.com/alexiworld/coloredshapes.git
RUN mv coloredshapes product 
WORKDIR ./product
RUN unzip -P password product.zip

WORKDIR ./core-services
RUN gradle eclipse
RUN echo "version=1.0.0" > gradle.properties
RUN gradle war
RUN cp build/libs/core-services-1.0.0.war $TOMCAT/webapps/core-services.war

WORKDIR ../group-schedule
RUN gradle eclipse
RUN echo "version=1.0.0" > gradle.properties
RUN gradle war
RUN cp build/libs/group-schedule-1.0.0.war $TOMCAT/webapps/group-schedule.war

WORKDIR ../my-own-schedule
RUN gradle eclipse
RUN echo "version=1.0.0" > gradle.properties
RUN gradle war
RUN cp build/libs/my-own-schedule-1.0.0.war $TOMCAT/webapps/my-own-schedule.war

WORKDIR $TOMCAT/bin
RUN echo "export JAVA_OPTS=\"-Dcoloredshapes.env=local -Dcoloredshapes.cfg=/coloredshapes/product/external-config\"" > setenv.sh

WORKDIR /
RUN echo "./run.sh &"              > schedule.sh
RUN echo "sleep 30"               >> schedule.sh
RUN echo "mysql                < /coloredshapes/product/init_dbs.sql"       >> schedule.sh
RUN echo "mysql core-services  < /coloredshapes/product/core-services.sql"  >> schedule.sh
RUN echo "mysql group-schedule < /coloredshapes/product/group-schedule.sql" >> schedule.sh
RUN echo "$TOMCAT/bin/startup.sh" >> schedule.sh
RUN echo "sleep infinity"         >> schedule.sh
RUN chmod a+x schedule.sh

#ENTRYPOINT ["/schedule.sh"]
