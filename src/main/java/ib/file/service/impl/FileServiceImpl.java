package ib.file.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import ib.file.service.FileService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Service("fileService")
public class FileServiceImpl extends AbstractServiceImpl implements FileService {

	@Resource(name="fileDAO")
	FileDAO fileDAO;

    //게시판 글 파일리스트
    public List<Map> getFileList(Map<String, Object> map) throws Exception{
    	return fileDAO.getFileList(map);
    }

    //파일 db 저장 json Array
    public int insertFileListJson(Map<String, Object> map) throws Exception {

    	int seq =0;

    	JSONObject fileListObj = JSONObject.fromObject(map.get("fileList"));		//fileList 라는 파라미터로 넘어온 str 를 obj로
		JSONArray fileList = fileListObj.getJSONArray("items");				//obj 에 키(items) 을 array로
		Map<String,Object>fileMap = new HashMap();
		fileMap.put("rgId", map.get("rgId"));
		fileMap.put("offerSnb", map.get("offerSnb"));
		fileMap.put("reportYn", map.get("reportYn"));
		for(int i=0;i<fileList.size();i++){

			JSONObject file=(JSONObject)fileList.get(i);
			fileMap.put("realName", file.getString("realName"));	//원본이름
			fileMap.put("makeName", file.getString("makeName"));	//변경이름
			fileMap.put("path", file.getString("path"));			//경로
			fileMap.put("fileCategory", file.getString("fileCategory"));	//카테고리 
			fileMap.put("subCd", file.getString("subCd"));			//0임 
			seq=fileDAO.insertFileList(fileMap);
		}

		
    	return seq;
    }

    //파일 db -> 물리 삭제
    public void fileDeleteDbAndPhy(Map<String, Object> map) throws Exception{

    	List<Map>fileList = getFileList(map); 		//파라메터로 fileSnb or fileCategory +offerSnb 를 넘겨 조회할 수 있다.

    	if(fileList.size() > 0){
			for(int i=0;i<fileList.size();i++){
				
				String fileSnb =  fileList.get(i).get("fileSnb").toString();
				
				Map<String,Object>fileMap = new HashMap();
				fileMap.put("sNb", fileSnb);
				fileMap.put("makeName", fileList.get(i).get("makeName"));
				fileMap.put("path", fileList.get(i).get("path"));
				
				fileDAO.fileDeleteDb(fileMap);	//db삭제
	
				deleteFile(fileMap);			//물리삭제
			}
    	}
    }


    //파일 물리적 삭제
    public int deleteFile(Map<String, Object> map) throws Exception {
    	int cnt =-1;
		String fileName="";
		if(map.get("makeName")!=null){
			fileName = map.get("makeName").toString();
			String filePath = map.get("path").toString();

			File deleteFile = new File(filePath + fileName);
			deleteFile.delete();
			cnt=1;
		}
    	return cnt;
    }

	// 파일 다운로드
	public void doFileDownload( String filePath,String fileNm,String orgFileNm, HttpServletRequest req, HttpServletResponse res) throws Exception {
		File uFile = new File(filePath+fileNm);
		int fSize = (int) uFile.length();

		if(fSize > 0) {
			String OnlyFileExt = fileNm.substring(fileNm.lastIndexOf('.') + 1).toLowerCase();	// 확장자
			String mimetype = "application/x-msdownload";

			if(OnlyFileExt.equals("doc") || OnlyFileExt.equals("docx")) mimetype = "application/msword";
			else if(OnlyFileExt.equals("xls") || OnlyFileExt.equals("xlsx")) mimetype = "vnd.ms-excel";			// x-msexcel
			else if(OnlyFileExt.equals("ppt") || OnlyFileExt.equals("pptx")) mimetype = "vnd.ms-powerpoint";	// x-mspowerpoint
			else if(OnlyFileExt.equals("pdf")) mimetype = "application/pdf";
			else if(OnlyFileExt.equals("txt")) mimetype = "text/plain";
			else if(OnlyFileExt.equals("htm") || OnlyFileExt.equals("html")) mimetype = "text/html";

			else if(OnlyFileExt.equals("png")) mimetype = "image/png";
			else if(OnlyFileExt.equals("gif")) mimetype = "image/gif";
			else if(OnlyFileExt.equals("jpg") || OnlyFileExt.equals("jpeg") || OnlyFileExt.equals("jpe")) mimetype = "image/jpeg";
			else if(OnlyFileExt.equals("tif") || OnlyFileExt.equals("tiff")) mimetype = "image/tiff";

			
			res.setContentType(mimetype);
			setDisposition(orgFileNm, req, res);
			res.setContentLength(fSize);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(res.getOutputStream());

				FileCopyUtils.copy(in, out);

			} catch (Exception ex) {
				ex.printStackTrace();
				throw ex;
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (Exception ignore) {
						// no-op
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (Exception ignore) {
						// no-op
					}
				}
			}
		} else {

			PrintWriter writer = res.getWriter();
			writer.print("<html><script>alert(\"FILE NOT FOUND!!\");history.back();</script></html>");

		}
	}
	
	// 파일 다운로드
	public void doFileDownloadApk( HttpServletRequest req, HttpServletResponse res, String filePath) throws Exception {
		
		
		String userAgent = (String)req.getHeader("User-Agent");
		
		String fileName = filePath + "app-release.apk";
		//boolean isIos = false;
		//if(userAgent.contains("iPhone") || userAgent.contains("iPod")) isIos =true;
			
		//if(isIos) fileName = filePath + "SYNERGY IB.plist";
		
		
		
		File uFile = new File(fileName);
		int fSize = (int) uFile.length();

		if(fSize > 0) {
			String mimetype = "application/vnd.android.package-archive";

			//if(isIos) mimetype = "application/plist";

			res.setContentType(mimetype);
			setDisposition("apk", req, res);
			res.setContentLength(fSize);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(res.getOutputStream());

				FileCopyUtils.copy(in, out);

			} catch (Exception ex) {
				ex.printStackTrace();
				throw ex;
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (Exception ignore) {
						// no-op
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (Exception ignore) {
						// no-op
					}
				}
			}
		} else {

			PrintWriter writer = res.getWriter();
			writer.print("<html><script>alert(\"FILE NOT FOUND!!\");</script></html>");

		}
	}

	// Disposition 지정하기
	private static void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if(browser.equals("MSIE")) encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		else if(browser.equals("Firefox")) encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		else if(browser.equals("Opera")) encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		else if(browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if(c > '~') sb.append(URLEncoder.encode("" + c, "UTF-8"));
				else sb.append(c);
			}
			encodedFilename = sb.toString();
		}
		else throw new IOException("Not supported browser");
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if("Opera".equals(browser)) response.setContentType("application/octet-stream;charset=UTF-8");
	}

	// 브라우저 구분 얻기
	private static String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if(header.indexOf("MSIE") > -1) return "MSIE";
		else if(header.indexOf("Trident") > -1) return "MSIE";
		else if(header.indexOf("Chrome") > -1) return "Chrome";
		else if(header.indexOf("Opera") > -1) return "Opera";
		return "Firefox";
	}

	//기존 프로필사진이 있다면 DELETE
	public int deleteUserProfileImg(Map<String, Object> map) throws Exception{
		fileDAO.updateDelFlagUserProfileImg(map);
		return 1;
	}

	//userId 프로필 사진의 fileSeq 조회
	public int getUserProfileImgSeq(Map<String, Object> map) throws Exception{
		return fileDAO.getUserProfileImgSeq(map);
	}
	//파일 저장 for Editor..
	public int insertFileList(Map<String, Object> map) throws Exception{
		return fileDAO.insertFileList(map);
	}


}
