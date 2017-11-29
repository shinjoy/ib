package ib.basic.web;

import java.util.Calendar;
import java.util.Enumeration;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import ib.work.service.WorkVO;

public class Util{

	
	/**
	 * 배열 null이나 "" 여부 확인 후 초기화
	 * @MethodName : init_array
	 * @param array : 입력값배열
	 * @param number : 배열인덱스넘버
	 * @param vo : return값을 저장하기위해 받음
	 * @param list_leng : 기존저장된 list length
	 * @param return_value : 초기화를 위한 값
	 * @return boolean
	 */
	public static boolean init_array(
			String[] array
			, int number
			, WorkVO vo
			, int list_leng
			, String return_value){
		
		if(array!=null && list_leng>number){
			if(array[number]!=null && !"".equals(array[number])){
				vo.setRtnVal(array[number]);
			}else{
				if(list_leng==2000) return false;
				vo.setRtnVal(return_value);
			}
			return true;
		}else{
			return false;
		}
	}
	
	
	// AES 암호화
	public static String encrypt(String message, String  key) throws Exception{
        
	    if(message == null){
	        return null;
	    }else{
	        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "AES");
	         
	        Cipher cipher = Cipher.getInstance("AES");
	        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
	         
	        byte[] encrypted = cipher.doFinal(message.getBytes());
	         
	        return byteArrayToHex(encrypted);
	    }
	}
	 
	private static String byteArrayToHex(byte[] encrypted) {
	     
	    if(encrypted == null || encrypted.length ==0){
	        return null;
	    }
	     
	    StringBuffer sb = new StringBuffer(encrypted.length * 2);
	    String hexNumber;
	     
	    for(int x=0; x<encrypted.length; x++){
	        hexNumber = "0" + Integer.toHexString(0xff & encrypted[x]);
	        sb.append(hexNumber.substring(hexNumber.length() - 2));
	    }
	     
	    return sb.toString();
	}
	
	// 복호화
	public static String decrypt(String encrypted, String key) throws Exception{
	     
	    if(encrypted == null){
	        return null;
	    }else{
	        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "AES");
	         
	        Cipher cipher = Cipher.getInstance("AES");
	        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
	         
	        byte[] original = cipher.doFinal(hexToByteArray(encrypted));
	         
	        String originalStr = new String(original);
	         
	        return originalStr;
	    }
	}
	  
	private static byte[] hexToByteArray(String hex) {
	     
	    if(hex == null || hex.length() == 0){
	        return null;
	    }
	     
	    //16진수 문자열을 byte로 변환
	    byte[] byteArray = new byte[hex.length() /2 ];
	     
	    for(int i=0; i<byteArray.length; i++){
	        byteArray[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2*i+2), 16);
	    }
	    return byteArray;
	}

	/*
	 * MAP 타입 변수 Key, value 콘솔 출력 
	 */
	public static void printMap(HttpServletRequest req){
		
		Enumeration params = req.getParameterNames();
		System.out.println("---- HttpServletRequest Parameter Start ----");
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println("## N/V = " + name + " : " +req.getParameter(name));
		}
		System.out.println("---- HttpServletRequest Parameter End ----");		
	}
	
	/*
	 * MAP 타입 변수 Key, value 콘솔 출력 
	 */
	public static void printMap(Map<String,Object> map){
		
		System.out.println("---- MAP Parameter Start ----");

        for( Object key : map.keySet() ){
            System.out.println( String.format("키 : %s, 값 : %s", key.toString(), map.get(key)).toString() );
        }

		System.out.println("---- MAP Parameter End ----");
	}
	
	// 시스템 로그 출력
	public static void d(String tag, String content){
		System.out.println("[" + tag + "]" + content);
	}
}