public class StringUtils {
    public static String prettyPhone(String phone){
        if(phone == null || phone == '') return '';
        
        String pattern = '{0} {1}-{2}';        
        String response = '';
        
        phone = sanitizeString(phone);
        phone = phone.replaceAll('-', '');
        
        Integer index = phone.substring(2).length() > 8 ? 7 : 6;
        
        String groupOne = phone.substring(0, 2);
        String groupTwo = phone.substring(2, index);
        String groupThree = phone.substring(index);
        
        response = String.format(pattern, new List<Object>{groupOne, groupTwo, groupThree});
        
        return response;
    }
    
    public static String sanitizeString(String str){
        str = str.toLowerCase().trim();
        Map<String, String> regexReplaces = new Map<String, String>();
        
        regexReplaces.put('[\\s]', '-');
        regexReplaces.put('[àáâãäå]', 'a' );
        regexReplaces.put('[èéêë]'  , 'e' );
        regexReplaces.put('[ìíîï]'  , 'i' );
        regexReplaces.put('[òóôõö]' , 'o' );
        regexReplaces.put('[ùúûü]'  , 'u' );
        regexReplaces.put('[ýÿ]'    , 'y' );
        regexReplaces.put('æ'       , 'ae');
        regexReplaces.put('œ'       , 'oe');
        regexReplaces.put('ç'       , 'c' );
        regexReplaces.put('ñ'       , 'n' );
        
        for(String regex : regexReplaces.keySet()) str = str.replaceAll(regex, regexReplaces.get(regex));
        
        return str;
    }
    
    public static String camelCase(String str){
        str = sanitizeString(str);
        str = str.replaceAll('-', ' ');
        String response = '';
        
        for(String s : str.split(' ')) response += s.capitalize(); 
        
        return response.uncapitalize();
    }
    
    public static String prettyMoney(Decimal value, String coin){
        
        List<String> lstValues = String.valueOf(value.setScale(2, System.roundingMode.DOWN)).split('\\.');
        Map<String, String> currencySymbol = new Map<String, String>();
        currencySymbol.put('BRL', 'R$');
        currencySymbol.put('USD', '$');
        currencySymbol.put('GBP', '£');
        currencySymbol.put('EUR', '€');
        currencySymbol.put('CAD', 'C$');
        
        String coinString = currencySymbol.get(coin) + ' {0},{1}';
        
        String majorValue = lstValues.size() > 0 ? setDecimalPlaces(lstValues[0], '.', 1) : '0';
        String minorValue = lstValues.size() > 1 ? setDecimalPlaces(lstValues[1] != '0' ? lstValues[1] : '00', '.', 3) : '00';
        
        return String.format(coinString, new List<Object>{majorValue, minorValue});
    }
    
    public static String setDecimalPlaces(String num, String separator, Integer steps){
        if(num == null || num == '') return '0';
        
        String response = '';
        String aux = '';
        
        for(Integer i = num.length() - 1; i >= 0; i--){
            if(aux.length() == steps){
                response += aux + separator;
                aux = '';
            }
            
            aux += num.substring(i, i + 1);
        }
        
        response += aux;
        
        return response.reverse();         
    }
}
