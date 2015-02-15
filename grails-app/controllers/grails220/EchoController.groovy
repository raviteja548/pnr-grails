package grails220

import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import javax.xml.bind.JAXBContext
import javax.xml.bind.Unmarshaller

class EchoController {

    def index() {

    }

    def index1(){
    }

    def pnr(){

    }


    def checkpnr(){
        PnrData data = new PnrData();
        //def message = params.value;
        def message = params.rf;
        String isParsed = null;
         println message;
        if(message.trim().length() == 10){

            isParsed = "YES";

            String hmac = getHmac(message.trim());

            String str = getPnrResponse(message, hmac);

            System.out.println("HMAC=================="+hmac+" PNR JSON================"+str);


           // render(template:'diff', model:[searchresults:pd,sr:pd.passengers,er:pd.error,parsed:isParsed])
            render str;

        }
        if(message.trim().length()!=10){
            isParsed = "NO";
            render(template:'diff', model:[parsed:isParsed])
        }

    }



    def String getHmac(String pnr){
        String mykey = "34b16a158402a9caf50480c885cf07f3";
        String test = "json2b965b0cdcc51fd64cf77224165c43e8"+pnr;
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

    def  String getPnrResponse(String pnr,String pnrHmac) {

        //More validations can be added like format is one of xml or json.
        String endpoint = "http://railpnrapi.com/api/check_pnr/pnr/"+pnr+"/format/json/pbapikey/2b965b0cdcc51fd64cf77224165c43e8/pbapisign/"+pnrHmac;
        //String endpoint = "http://railpnrapi.com/api/check_pnr/pnr/4102692788/format/json/pbapikey/2b965b0cdcc51fd64cf77224165c43e8/pbapisign/25ce144d5d0d3d1420a0b2afcd24f3f34deb1575";
        println "=============is endpoint"+endpoint;
        System.out.println("=============is endpoint"+endpoint);
        System.out.println(endpoint);
        HttpURLConnection request = null;
        BufferedReader rd = null;
        StringBuilder response = null;
        try{

            URL endpointUrl = new URL(endpoint);
            request = (HttpURLConnection)endpointUrl.openConnection();
            request.setRequestMethod("GET");
            request.connect();

            rd  = new BufferedReader(new InputStreamReader(request.getInputStream()));
            response = new StringBuilder();
            String line = null;
            while ((line = rd.readLine()) != null){
                response.append(line + "\n");
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
          println "response is"+response;
        return response != null ? response.toString() : "No Response";
    }


    def PnrData parseXmlToVO(String asXml){
        JAXBContext jaxbContext = JAXBContext.newInstance(Xml.class);

        Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
        Xml xmll = (Xml) jaxbUnmarshaller.unmarshal(new StringReader(asXml.toString()));
        System.out.println(xmll);

        String respCode = xmll.getResponseCode();
        System.out.println("response code is "+respCode);
        String pnr = xmll.getPnr();
        String train_num = xmll.getTrainNum();
        String train_name = xmll.getTrainName();
        String doj = xmll.getDoj();

        Xml.FromStation fromSt = xmll.getFromStation();
        String fromStCode = fromSt.getCode();
        String fromStName = fromSt.getName();

        Xml.ToStation toSt = xmll.getToStation();
        String toStCode = toSt.getCode();
        String toStName = toSt.getName();

        Xml.ReservationUpto resUp = xmll.getReservationUpto();
        String resUpCode = resUp.getCode();
        String resUpName = resUp.getName();

        Xml.BoardingPoint bop = xmll.getBoardingPoint();
        String bcode = bop.getCode();
        String bname = bop.getName();

        String clas = xmll.getClazz();
        String nop = xmll.getNoOfPassengers();
        String chp = xmll.getChartPrepared();

        String error = xmll.getError();

        Xml.Passengers passengers = xmll.getPassengers();

        List<Xml.Passengers.Passenger> pass  = passengers.getPassenger();

        // Convert to PnrData

        PnrData pd = new PnrData();

        pd.setResponseCode(Long.parseLong(respCode));
        pd.setPnr(Long.parseLong(pnr));
        pd.setTrainName(train_name);
        pd.setTrainNo(train_num);
        pd.setDoj(doj);

        pd.setFromCode(fromStCode);
        pd.setFromStation(fromStName);

        pd.setToCode(toStCode);
        pd.setToStation(toStName);

        pd.setrUpToCode(resUpCode);
        pd.setResupName(resUpName);

        pd.setBoardCode(bcode);
        pd.setBoardName(bname);

        pd.setCls(clas);
        //NO no of passengers
        pd.setChartPrepared(chp);
        pd.setError(error);
        List<Passengers> passList = new ArrayList<Passengers>();
        for(int i=0;i<pass.size();i++){
            Xml.Passengers.Passenger xindPass = pass.get(i);

            Passengers iPas = new Passengers();
            iPas.setSr(xindPass.getSr());
            iPas.setbStatus(xindPass.getBookingStatus());
            iPas.setcStatus(xindPass.getCurrentStatus());

            passList.add(iPas);


        }

           pd.setPassengers(passList);


        return pd;
    }


}
