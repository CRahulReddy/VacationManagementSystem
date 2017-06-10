


import java.io.IOException;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

public class VMSendMail {

    static final  String FROM = "osking@uno.edu";  
    static final String TO = "success@simulator.amazonses.com";                                                      
    static  String BODY = "";
    static  String SUBJECT = "";


    public static void main(String[] args) throws IOException {
    	                                                     
    	     BODY = "This email was sent through Amazon SES by using the AWS SDK for Java.";
    	    SUBJECT = "Amazon SES test (AWS SDK for Java)";
    	    sendMail();
    
    }
    	  public static boolean sendMail() throws IOException {

       
        Destination destination = new Destination().withToAddresses(new String[]{TO});

       
        Content subject = new Content().withData(SUBJECT);
        Content textBody = new Content().withData(BODY);
        Body body = new Body().withText(textBody);

        // Create a message with the specified subject and body.
        Message message = new Message().withSubject(subject).withBody(body);

        // Assemble the email.
        SendEmailRequest request = new SendEmailRequest().withSource(FROM).withDestination(destination).withMessage(message);

        try {
            System.out.println("Attempting to send an email through Amazon SES by using the AWS SDK for Java...");

            AWSCredentials credentials = null;
            try {
              //  credentials = new ProfileCredentialsProvider().getCredentials();
            	credentials = new BasicAWSCredentials("AKIAICWJDTLVAU3GIWVQ",
                		"//NTgZK8VUoiT729K+fdlLh8qRmQMI8E5wLk+ey9");
           } catch (Exception e)
            	  
            	  {
        	   System.out.println(e.getMessage());
        	   return false;

            }

             AmazonSimpleEmailServiceClient client = new AmazonSimpleEmailServiceClient(credentials);
     Region REGION = Region.getRegion(Regions.US_WEST_2);
            client.setRegion(REGION);

            // Send the email.
            client.sendEmail(request);
            System.out.println("Email sent!");
            return true;

        } catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
            return false;
        }
    }
}
