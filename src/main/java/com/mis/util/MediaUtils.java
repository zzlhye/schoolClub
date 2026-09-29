package com.mis.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;

	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}

	// 확장자를 기준으로 이미지 MIME Type 반환
	// 이미지 파일이 아닌 경우 null 반환
	public static MediaType getMediaType(String fileName) {
		return mediaMap.get(fileName.toUpperCase());
	}
}