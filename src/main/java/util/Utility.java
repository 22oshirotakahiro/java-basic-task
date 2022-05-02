package util;

public class Utility {

    public static boolean isNullOrEmpty(String str) {
        if(str == null || str.isEmpty()) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 石の残数に応じて表示する"●"用のhtmlソースを生成します
     * @return
     */
    // todo:ここにgetStoneDisplayHtmlメソッドを定義
    public static String getStoneDisplayHtml(int n) {
    	String stone = "";
    	for (int i = 0; i < n; i++) {
    		int count = 1;
    		stone += "●";
    		if (count % 10 == 0) {
    			stone = "<br>";
    		}
    		count++;
    	}
    	return stone;
    }

}
