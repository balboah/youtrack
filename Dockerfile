from dockerfile/java
MAINTAINER Johnny Bergström <docker@joonix.se>

RUN useradd -m youtrack
WORKDIR /home/youtrack

RUN wget -q http://download.jetbrains.com/charisma/youtrack-5.1.2.jar -O youtrack.jar

ADD log4j.xml /home/youtrack/

ENTRYPOINT ["su", "-l", "youtrack", "-c"]
CMD ["java -Xmx512m -XX:MaxPermSize=150m -Djetbrains.mps.webr.log4jPath=/home/youtrack/log4j.xml -Djava.awt.headless=true -jar youtrack.jar 8080"]

EXPOSE 8080