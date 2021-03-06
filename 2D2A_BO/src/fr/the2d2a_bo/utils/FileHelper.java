package fr.the2d2a_bo.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import fr.the2d2a.exception.FonctionalException;

public class FileHelper {
	
	private static Logger logger = Logger.getLogger(FileHelper.class);

	public static boolean deleteFile(String path, String fileName) {
		
		File file = new File(path + fileName);
		if (file.exists()) {
			logger.debug("la file existe : " + file.toString());
			return file.delete();
		} else {
			logger.debug("la file n'existe pas : " + file.toString());
		}
		return false;
	}
	
	public static String writeFile(String path, MultipartFile file) {
		try {
			byte[] fileByte = file.getBytes();
			String fileName = file.getOriginalFilename();
			logger.info("Ecriture du fichier sur le disque : " + path + fileName);
			String newFileName = FileHelper.createFileName(fileName);
	        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + newFileName));
	        bos.write(fileByte);
	        bos.flush();
	        bos.close();
	        return newFileName;
		}
		catch (IOException e) {
			logger.warn("Probl�me d'�criture du fichier sur le disque : " + e.getMessage());
			return null;
		} catch (FonctionalException e) {
			logger.warn("Probl�me de g�n�ration du nom de fichier");
			return null;
		} 
	}
	
	public static String createFileName(String originalFileName) throws FonctionalException {
		StringTokenizer st = new StringTokenizer(originalFileName, ".");
		String extension = null;
		if (st.countTokens() <= 1)
			throw new FonctionalException();
		while (st.hasMoreElements()) 
			extension = st.nextToken();
		long currentTime = System.currentTimeMillis();
		int rdm = (int)(Math.random()*100000);		
		return rdm+"_"+currentTime+"."+extension;
	}
	
	public static String manageUploadedFile(MultipartFile file, String oldFile, String path, String pathServer) {
		if (file.isEmpty()) {
			logger.debug("In manageUploadedFile, pas de file");
			return oldFile;
		}
		else {
			logger.debug("OldFile : " + oldFile);
			boolean fileDeleted = FileHelper.deleteFile(path, oldFile);
			logger.debug("File deleted ? " + fileDeleted);
			
			String fileGenerated = FileHelper.writeFile(path, file);
	        logger.debug("File created ? " + fileGenerated);
	        return pathServer+fileGenerated;
		}
	}
	
	public static String manageUploadedImageFile(MultipartFile file, String oldFile, String path, String pathServer) {
		if (file.isEmpty()) {
			logger.debug("In manageUploadedFile, pas de file");
			logger.debug("OldFile : " + oldFile);
			if (oldFile == null) { //delete
				//boolean fileDeleted = FileHelper.deleteFile(path, oldFile);
				//logger.debug("File deleted ? " + fileDeleted);
				return null;
			} else //update				
				return oldFile;
		}
		else {//add
			logger.debug("OldFile : " + oldFile);
			//boolean fileDeleted = FileHelper.deleteFile(path, oldFile);
			//logger.debug("File deleted ? " + fileDeleted);
			
			String fileGenerated = FileHelper.writeFile(path, file);
	        logger.debug("File created ? " + fileGenerated);
	        return pathServer+fileGenerated;
		}
	}
}
