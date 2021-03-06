package fr.the2d2a.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import fr.the2d2a.bean.Artiste;

public interface EditeurDao {

	public List<Artiste> getAllEditeurByLang(String lang) throws DataAccessException;
	
	public Artiste getEditeurByNameAndLang(String lang, String prenom, String nom) throws DataAccessException;
}
