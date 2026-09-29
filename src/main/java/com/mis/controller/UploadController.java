package com.mis.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mis.util.MediaUtils;
import com.mis.util.UploadFileUtils;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// servlet-context.xml에 설정된 uploadPath 주입
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 업로드 화면 요청
	@GetMapping("/uploadAjax")
	public void uploadAjax() {

	}

	// 파일 업로드
	@ResponseBody
	@PostMapping(value = "/uploadAjax", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());

		// 서버에 파일 저장 후 저장된 파일 경로 반환
		String savedPath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

		return new ResponseEntity<String>(savedPath, HttpStatus.CREATED);
	}

	// 파일 조회 및 다운로드
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("fileName: " + fileName);

		try {

			// 인코딩된 파일명을 UTF-8로 디코딩
			fileName = URLDecoder.decode(fileName, "UTF-8");

			// 확장자를 이용하여 이미지 여부 확인
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			// 서버에 저장된 파일 읽기
			in = new FileInputStream(uploadPath + File.separator + fileName);

			// 이미지 파일
			if (mType != null) {

				headers.setContentType(mType);

			// 일반 파일
			} else {

				fileName = fileName.substring(fileName.indexOf("_") + 1);

				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			// 파일 내용을 byte[]로 반환
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();

			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {

			// 파일 스트림이 생성된 경우에만 닫기
			if (in != null) {
				in.close();
			}
		}

		return entity;
	}

	// 업로드된 파일 삭제
	@ResponseBody
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("delete file: " + fileName);

		// 확장자를 이용하여 이미지 여부 확인
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		// 이미지 파일인 경우 원본 이미지 삭제
		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);

			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		// 업로드된 파일 삭제
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}