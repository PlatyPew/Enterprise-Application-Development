package websecurity;

import java.util.regex.Pattern;
import java.io.*;
import javax.crypto.*;
import javax.crypto.spec.*;

public class Secure {
	public static boolean sanitise(String input) {
		if (Pattern.matches("^[a-zA-Z0-9\\-\\ ]+$",input)) {
			return true;
		} else {
			System.out.println("Warning! Possible attack");
			return false;
		}
	}
	
	public static byte[] genMac(String impt) throws Exception {
		File key = new File("key.bin");
		byte[] keydata = new byte[(int)key.length()];
		FileInputStream f = new FileInputStream(key);
		f.read(keydata);
		f.close();

		SecretKey originalKey = new SecretKeySpec(keydata, 0, keydata.length, "HmacSHA512");

		// Create a MAC and initialize with secret key
		Mac mac = Mac.getInstance("HmacSHA512");
		mac.init(originalKey);

		// Create a digest
		byte[] b = impt.getBytes("UTF-8");
		byte[] digest = mac.doFinal(b);
		
		return digest;
	}
}