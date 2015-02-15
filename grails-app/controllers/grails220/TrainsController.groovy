package grails220

import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec



class TrainsController {

    def index() {

    }

    def trainsBetweenStationsService(){
        def from = params.from;
        def to = params.to;
        def doj = params.doj;
        String pbapikey = "public key";
        String hmac = getHmacForTrainsBwStations(from,to,doj);
        System.out.println(from+to+doj);
        String endpoint = "http://railpnrapi.com/api/trains_between_stations/fscode/"+from+"/tscode/"+to+"/date/"+doj+"/orderby/time/format/json/pbapikey/"+pbapikey+"/pbapisign/"+hmac;
        String response = parseUrl(endpoint);
        println response;
        render response;
    }

    def seatAvailabilityService(){
        String tnum = params.tnum;
        String from = params.from;
        String to = params.to;
        String doj = params.doj;
        String clazz = params.clazz;
        String quota = params.quota;
        String format = "json";

        if(!quota){
            quota="gn";
        }

        String pubapiKey ="publickey";
        String hmacString = getHmacForSeatAvailability(tnum,from.toLowerCase(),to.toLowerCase(),doj,clazz.toLowerCase(),quota.toLowerCase(),format);
        println hmacString;
        String endpoint   =  "http://railpnrapi.com/api/check_avail/tnum/"+tnum+"/fscode/"+from+"/tscode/"+to+"/date/"+doj+"/class/"+clazz.toUpperCase()+"/quota/"+quota.toUpperCase()+"/format/"+format+"/pbapikey/"+pubapiKey+"/pbapisign/"+hmacString;
println endpoint;
        String response = parseUrl(endpoint);
        render response;
    }

    String getHmacForTrainsBwStations(String from,String to,String doj){
        // order is clazz dateJ format fscode orderby pbapikey tscode
        String mykey = "privatekey";
        String pubapiKey ="publickey";
        String test = doj+"json"+""+from+"time"+""+pubapiKey+""+to;
        StringBuffer sb = new StringBuffer();
        try {
            Mac mac = Mac.getInstance("HmacSHA1");
            SecretKeySpec secret = new SecretKeySpec(mykey.getBytes(),
                    "HmacSHA1");
            mac.init(secret);
            byte[] digest = mac.doFinal(test.getBytes());
            for (byte b : digest) {
                System.out.format("%02x",b);
                sb.append(String.format("%02x",b));
            }
            System.out.println();
            System.out.println(sb);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sb.toString();
    }

    String getHmacForSeatAvailability(String tnum,String fscode,String tscode,String doj,String clazz,String quota,String format){
        // order is clazz dateJ format fscode orderby pbapikey tscode
        String mykey = "privatekey";
        String pubapiKey ="public key";
        String test = clazz+""+doj+""+format+""+fscode+""+pubapiKey+""+quota+""+tnum+""+tscode;
        StringBuffer sb = new StringBuffer();
        try {
            Mac mac = Mac.getInstance("HmacSHA1");
            SecretKeySpec secret = new SecretKeySpec(mykey.getBytes(),
                    "HmacSHA1");
            mac.init(secret);
            byte[] digest = mac.doFinal(test.getBytes());
            for (byte b : digest) {
                System.out.format("%02x",b);
                sb.append(String.format("%02x",b));
            }
            System.out.println();
            System.out.println(sb);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sb.toString();
    }
















    String parseUrl(String url){


        HttpURLConnection request = null;
        BufferedReader rd = null;
        StringBuilder response = null;
        try{
            URL endpointUrl = new URL(url);
            request = (HttpURLConnection)endpointUrl.openConnection();
            request.setRequestMethod("GET");
            request.connect();

            rd  = new BufferedReader(new InputStreamReader(request.getInputStream()));
            response = new StringBuilder();
            String line = null;
            while ((line = rd.readLine()) != null){
                response.append(line + "\n");
            }
        } catch (MalformedURLException e) {
            System.out.println("Exception: " + e.getMessage());
        } catch (ProtocolException e) {
            System.out.println("Exception: " + e.getMessage());
        }  catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } finally {
            try{
                request.disconnect();
            } catch(Exception e){
            }

        }
        return response.toString();
    }
}