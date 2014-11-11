package grails220

import javax.crypto.Mac
import javax.crypto.spec.SecretKeySpec
import javax.xml.bind.JAXBContext
import javax.xml.bind.Unmarshaller

class EchoController {

    def index() {

    }

    def pnr(){

    }


    def checkpnr(String rf){
        PnrData data = new PnrData();
        //def message = params.value;
        def message = rf;
        String isParsed = null;

        if(message.trim().length() == 10){

            isParsed = "YES";

            String hmac = getHmac(message.trim());

            String str = getPnrResponse(message, hmac);

            System.out.println("HMAC=================="+hmac+" PNR JSON================"+str);

            data = parseXmlToVO(str);

            log.info("=============is pnr data"+data.toString());
            System.out.println("=============is pnr data"+data.toString()+"==========");



            PnrData pd = new PnrData();
            if(data.error.equals("")){
                pd.responseCode = data.responseCode;
                pd.trainName = data.trainName;
                pd.trainNo = data.trainNo;
                pd.passengers = data.passengers;
                pd.doj = data.doj;
                pd.fromCode = data.fromCode;
                pd.fromStation = data.fromStation
                pd.toCode = data.toCode;
                pd.toStation = data.toStation;
                pd.chartPrepared = data.chartPrepared;
                pd.boardCode = data.boardCode;
                pd.cls = data.cls;
                pd.resupCode = data.resupCode;
                pd.resupName  = data.resupName;
            }else{
                pd.error = data.error;
            }


            render(template:'diff', model:[searchresults:pd,sr:pd.passengers,er:pd.error,parsed:isParsed])

        }
        if(message.trim().length()!=10){
            isParsed = "NO";
            render(template:'diff', model:[parsed:isParsed])
        }

    }



    def String getHmac(String pnr){
        String mykey = "your secret key";
        String pubapiKey ="your pub api key"
        String test = "json"+pubapiKey+pnr;
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
			String apiKey="your pub api key";
        //More validations can be added like format is one of xml or json.
        String endpoint = "http://railpnrapi.com/api/check_pnr/pnr/"+pnr+"/format/xml/pbapikey/"+apiKey+"/pbapisign/"+pnrHmac;

        log.info("=============is endpoint"+endpoint);
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
        } catch (MalformedURLException e) {
            System.out.println("Exception: " + e.getMessage());
        } catch (ProtocolException e) {
            System.out.println("Exception: " + e.getMessage());
        } catch (IOException e) {
            System.out.println("Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } finally {
            try{
                request.disconnect();
            } catch(Exception e){
            }

            if(rd != null){
                try{
                    rd.close();
                } catch(IOException ex){
                }
                rd = null;
            }
        }

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
