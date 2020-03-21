public class WeatherForecastService {
    
    public static void getWeatherByCityAndDate(String cityName){
        
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('GET https://api.weather.yandex.ru/v1/forecast?lat=55.75396&lon=37.620393&extra=true')
        request.setEndpoint('http://api.worldweatheronline.com/premium/v1/weather.ashx?key=67636f9cedc24e13a12121114200103&q=48.85,2.35&format=json');
        request.setMethod('GET');
        request.setTimeout(60000);
        HttpResponse response = new Http().send(request);
        
        
       // Data data = (Data) serializer.deserialize(response.getBody(), Data.class);
       // Weather weather = (Weather)JSON.deserialize(response.getBody(),Weather.class);
		// data
 		Map<String,Object> weather = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());

        
        Map<String,Object> obj = (Map<String,Object>)weather.get('ClimateAverages');
        

		//Map<String,Object> n = (Map<String,Oject>)obj.get('')            
        System.debug(weather.values());            
        
    }
    private class Weather{
        public Map<String,String> current_condition;
    }

}