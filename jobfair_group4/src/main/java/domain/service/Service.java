package domain.service;

import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import domain.db.JobfairDataRepository;
import domain.db.SpotDataRepository;
import domain.db.SpotRepository;
import domain.db.UserRepository;
import domain.model.Spot;
import domain.model.SpotData;
import domain.model.User;

public class Service {
	
	private SpotRepository spotDB;
	private UserRepository userDB;
	private SpotDataRepository dataDB;
	private JobfairDataRepository jobfairDB;

	public Service(Properties properties) {
		spotDB = new SpotRepository(properties);
		userDB = new UserRepository(properties);
		dataDB = new SpotDataRepository(properties);
		jobfairDB = new JobfairDataRepository(properties);
	}

	public void close() {
		spotDB.close();
		userDB.close();
		dataDB.close();
		jobfairDB.close();
	}

	public User getUser(String userID) {
		return getUserRepository().get(userID);
	}
	
	public List<User> getAllCompaniesAlphabeticallyOnCompany() {
		return getUserRepository().getAllCompaniesAlphabeticallyOnCompany();
	}
	
	public List<User> getAllCompaniesAlphabeticallyOnContact() {
		return getUserRepository().getAllCompaniesAlphabeticallyOnContact();
	}
	
	public List<User> getAllCompaniesAlphabeticallyOnEmail() {
		return getUserRepository().getAllCompaniesAlphabeticallyOnEmail();
	}

	public List<User> getAllCompaniesAlphabeticallyOnSpotid() {
		return getUserRepository().getAllCompaniesAlphabeticallyOnSpotid();
	}

	public void addUser(User user) {
		getUserRepository().add(user);
	}

	public void addUsers(List<User> users) {
		getUserRepository().addAll(users);
	}

	public void deleteUser(String userID) {
		getUserRepository().delete(userID);
	}

	public User getUserIfAuthenticated(String userID, String password) {
		return getUserRepository().getUserIfAuthenticated(userID, password);
	}

	public List<String> getUserIDsWithoutSpot() {
		return getUserRepository().getUserIDsWithoutSpot();
	}

	public List<String> getEmailFromUsersWithoutSpot() {
		return getUserRepository().getEmailFromUsersWithoutSpot();
	}
	
	public void updateUser(User user){
		getUserRepository().update(user);
	}

	private UserRepository getUserRepository() {
		return this.userDB;
	}

	public Spot getSpot(String spotId) {
		return getSpotRepository().get(spotId);
	}
	
	public Spot getSpotFromUser(String userID)
	{
		return getSpotRepository().getFromUser(userID);
	}
	
	public List<Spot> getAllSpots() {
		return getSpotRepository().getAll();
	}
	
	public List<Spot> getFreeSpots() {
		return getSpotRepository().getFreeSpots();
	}
	
	public List<Spot> getOccupiedSpots() {
		return getSpotRepository().getOccupiedSpots();
	}
	
	public List<Spot> getAlphabeticOccupiedSpots() {
		return getSpotRepository().getAlphabeticOccupiedSpots();
	}
	
	public void addUserToSpot(String spotId, User user) {
		getSpotRepository().addUserToSpot(spotId, user);
	}
	
	public void removeUserFromSpot(String spotId) {
		getSpotRepository().removeUserFromSpot(spotId);
	}

	public void updateSpot(Spot spot) {
		this.getSpotRepository().updateSpot(spot);
	}
	
	public SpotRepository getSpotRepository() {
		return spotDB;
	}
	
	public void dropAllUsers()
	{
		userDB.deleteAll();
		spotDB.removeAllUsersFromSpots();
	}

	public List<String> getAdminEmails() {
		return userDB.getAllAdminEmails();
	}

	public List<User> getAdmins() {
		return getUserRepository().getAdmins();
	}

	public void deleteAdmin(String userID) {
		getUserRepository().deleteAdmin(userID);
	}
	
	public List<SpotData> getHemisData()
	{
		return dataDB.getHemisfeerData();
	}
	
	public List<SpotData> getAtriumData()
	{
		return dataDB.getAtriumData();
	}

	public Calendar getDeadline(String name) {
		return getJobfairDataRepository().getDeadline(name);
	}

	public void setDeadline(String name, Calendar deadline) {
		getJobfairDataRepository().setDeadline(name, deadline);
	}

	public JobfairDataRepository getJobfairDataRepository() {
		return jobfairDB;
	}
}
