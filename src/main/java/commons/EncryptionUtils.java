package commons;

import java.security.MessageDigest;

public class EncryptionUtils {
    public static String getSHA512(String input) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(input.getBytes());
            byte[] bytes = md.digest();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(String.format("%02x", bytes[i]));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}

