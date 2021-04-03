## CISD (Corsicana Independent School District)
My second major personal project, built during my spare time in 2018, attempting to re-create the CISD website cisd.org as it was at the time. I didn't have time to finish it, but I got a good start on the front-end.

### Requirements to run:
- **Java 8**
- **Apache Tomcat 9**
- **GCP account**
- **GCP service account key w/ Datastore & Storage admin permissions**
- **GCP Storage bucket**
- **GCP Datastore instance (or local Datastore emulator)**
    - **https://cloud.google.com/datastore/docs/tools/datastore-emulator**

### Environment Variables:
- `GOOGLE_APPLICATION_CREDENTIALS`:
    - `/path/to/your/gcp_service_account_key.json`
- `BUCKET_NAME`:
    - `your-bucket.appspot.com`
- `DATASTORE_EMULATOR_HOST` (if using emulator): 
    - `localhost:8081`

### Run:
- IDE (IntelliJ):
    - `Run Configurations > Add New Configuration > Tomcat Server > Local`
        - `Server > Application server`: Tomcat 9
        - `Server > JRE`: 1.8
        - `Deployment > Artifact`: cisd:war (cisd:war exploded for hot reloading)
        - `Deployment > Application context`: /
        - Define environment variables - 2 options:
            - `Startup/Connection > Environment Variables`
            - `Server > VM options`

- Terminal:
    - NOTE: manual deployment of the app to a Tomcat server may cause future conflicts when running other apps using the same Tomcat server. It is recommended that you make a copy of your chosen Tomcat folder and run this app from that copy; _otherwise_, you may have to undo these changes before running another app using this Tomcat folder.
    
    - (`$CATALINA_HOME` here refers to location of your **Tomcat 9** folder)
    - `mvn clean package`
    - `cp target/cisd.war $CATALINA_HOME/webapps`
    - `rm -r $CATALINA_HOME/webapps/ROOT`
    - `nano $CATALINA_HOME/conf/server.xml`
        - Inside the `<Host>` node:
        ```xml
        <Context path="" docBase="cisd">
            <!-- Default set of monitored resources -->
            <WatchedResource>WEB-INF/web.xml</WatchedResource>
        </Context>
        ```
    - `$CATALINA_HOME/bin/catalina.sh start`