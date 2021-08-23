package name404.study.face.utils;

import org.apache.poi.util.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

public class Base64Utils{
   
    public static String encodeDateUri(MultipartFile fileItem) throws IOException {
        String attachment=null;
        InputStream inputstream=fileItem.getInputStream();
        byte[] imgdata= IOUtils.toByteArray(inputstream);
        inputstream.close();
        attachment="data:image/png;base64,"+ Base64.encodeBase64String(imgdata);
        return attachment;
    }
}