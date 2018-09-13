package com.boulder.cisd.util;

import com.boulder.cisd.objects.User;
import com.google.common.io.Files;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.multipart.FormDataMultiPart;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.Date;

public class EmailService {

    public static ClientResponse emailVerificationRequest(HttpServletRequest req, User user) {
        Date date = new Date();
        String url = "http://localhost:8080/activate?uid=" + user.getId().toString();
        String html = null;

        try {
            html = Files.asCharSource(
                    new File(req.getServletContext().getResource("/res/html/activate.html").toURI()),
                    StandardCharsets.UTF_8).read();
        } catch (IOException | URISyntaxException e) {
            e.printStackTrace();
        }
        html = html
                .replace("${url}", url)
                .replace("${date}", date.toString());

        Client client = Client.create();
        client.addFilter(new HTTPBasicAuthFilter("api", "key-b9cf0ebbf3bf5e0e33d1542e73351c5d"));
        WebResource webResource = client.resource("https://api.mailgun.net/v3/sandboxbc82f3612fb848c19eba2ccb77f063f6.mailgun.org/messages");
        FormDataMultiPart formData = new FormDataMultiPart();
        formData.field("from", "CISD.org <postmaster@sandboxbc82f3612fb848c19eba2ccb77f063f6.mailgun.org>");
        formData.field("to", user.getEmail());
        formData.field("subject", "Activate Your Account");
        formData.field("html", html);

        return webResource.type(MediaType.MULTIPART_FORM_DATA_TYPE)
                .post(ClientResponse.class, formData);
    }

}
