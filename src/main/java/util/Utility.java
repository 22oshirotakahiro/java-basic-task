package util;

public class Utility {

    public static boolean isNullOrEmpty(String str) {
        if(str == null || str.isEmpty()) {
            return true;
        }else {
            return false;
        }
    }

    public static String getStoneDisplayHtml(int n) {
    	String stone = "";
    	int count = 1;
    	for (int i = 0; i < n; i++) {
    		stone += "●";
    		if (count % 10 == 0) {
    			stone += "<br>";
    		}
    		count++;
    	}
    	return stone;
    }

}
