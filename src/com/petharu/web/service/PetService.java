package com.petharu.web.service;

import java.sql.SQLException;
import java.util.List;

import com.petharu.web.entity.Pet;

public interface PetService {
	public List<Pet> getPetList() throws ClassNotFoundException, SQLException;	
	
	public List<Pet> getPetList(int memberId) throws ClassNotFoundException, SQLException;

	int updatePetProfile(int id)throws ClassNotFoundException, SQLException;
	int deletePetProfile(int id)throws ClassNotFoundException, SQLException;
	int insertPetProfile(Pet pet) throws SQLException, ClassNotFoundException;

}
