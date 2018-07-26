FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase:dev_v3.4.1-2xenial0_cv0.2.14

LABEL software.version=201604
LABEL version=0.1
LABEL software=Passatutto

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="Metabolite pep score generator"



RUN R -e 'install.packages(c("R.utils","tools"),repos = "http://cran.us.r-project.org")' 
# Update & upgrade sources
RUN apt-get -y update

# Install development files needed
RUN apt-get -y install wget default-jre-headless unzip

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*


ADD passatutto/Passatutto /usr/local/bin/Passatutto

ADD scripts/*.r /usr/local/bin/
RUN chmod +x /usr/local/bin/*.r

# Add testing to container
ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

# Define Entry point script
#ENTRYPOINT ["java", "-cp", "/usr/local/bin/passatutto.jar"]
