package domain.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.thoughtworks.selenium.webdriven.commands.Close;

import domain.model.Spot;
import domain.model.User;

public class SpotRepository {

	private PreparedStatement statement;
	private Connection connection;
	private Properties properties;

	public SpotRepository(Properties properties)
	{
		try {
			Class.forName("org.postgresql.Driver");
			String url = properties.getProperty("url");
			connection = DriverManager.getConnection(url, properties);
			setProperties(properties);
			} catch (Exception e) {
			throw new DbException(e.getMessage(), e);
			}
	}
	
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
	}
	
	public Spot get(String spotID)
	{
		if (spotID.isEmpty())
		{
			throw new DbException("Niets te vinden !");
		}
		String sql = "SELECT * " + "FROM jobfair_group4.spots" + " WHERE spotID = ?;";
		Spot spot = new Spot(spotID);
		try
		{
			statement = connection.prepareStatement(sql);
			statement.setString(1, spotID);
			ResultSet results = statement.executeQuery();
			results.next();
			spot.setAmountTables(results.getInt("amountTables"));
			spot.setAmountChairs(results.getInt("amountChairs"));
			spot.setElectricity(results.getBoolean("electricity"));
			spot.setRemarks(results.getString("remarks"));
		} catch (SQLException e)
		{
			throw new DbException(e.getMessage(), e);
		}

		return spot;
	}
	
	
	public List<Spot> getAll(){
	List<Spot> list = new ArrayList<Spot>();
	String sql = "Select * FROM jobfair_group4.spots";
	try{
		statement = connection.prepareStatement(sql);
		ResultSet results = statement.executeQuery();
		while (results.next())
		{
			Spot spot = new Spot(results.getString("spotID"));
			spot.setAmountTables(results.getInt("amountTables"));
			spot.setAmountChairs(results.getInt("amountChairs"));
			spot.setElectricity(results.getBoolean("electricity"));
			spot.setRemarks(results.getString("remarks"));
			list.add(spot);
		}
	} catch (SQLException e)
	{
		throw new DbException(e);
	}
	return list;
	}
	
	
	
	public List<Spot> getFreeSpots()
	{
		List<Spot> list = new ArrayList<Spot>();
		String sql = "SELECT *" + " FROM jobfair_group4.spot WHERE userID IS NULL ";
		try
		{
			statement = connection.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Spot spot = new Spot(results.getString("spotID"));
				spot.setAmountTables(results.getInt("amountTables"));
				spot.setAmountChairs(results.getInt("amountChairs"));
				spot.setElectricity(results.getBoolean("electricity"));
				spot.setRemarks(results.getString("remarks"));
				list.add(spot);
			}
		} catch (SQLException e)
		{
			throw new DbException(e);
		}
		return list;
	}
	
	public List<Spot> getOccupiedSpots()
	{
		List<Spot> list = new ArrayList<Spot>();
		String sql = "SELECT *" + " FROM jobfair_group4.spot WHERE userID IS NOT NULL ";
		try
		{
			statement = connection.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Spot spot = new Spot(results.getString("spotID"));
				spot.setAmountTables(results.getInt("amountTables"));
				spot.setAmountChairs(results.getInt("amountChairs"));
				spot.setElectricity(results.getBoolean("electricity"));
				spot.setRemarks(results.getString("remarks"));
				list.add(spot);
			}
		} catch (SQLException e)
		{
			throw new DbException(e);
		}
		return list;
	}

	public List<Spot> getAlphabeticOccupiedSpots()
	{
		List<Spot> list = new ArrayList<Spot>();
		String sql = "SELECT *" + " FROM jobfair_group4.spot WHERE userID IS NOT NULL ORDER BY userID ";
		try
		{
			statement = connection.prepareStatement(sql);
			ResultSet results = statement.executeQuery();
			while (results.next())
			{
				Spot spot = new Spot(results.getString("spotID"));
				spot.setAmountTables(results.getInt("amountTables"));
				spot.setAmountChairs(results.getInt("amountChairs"));
				spot.setElectricity(results.getBoolean("electricity"));
				spot.setRemarks(results.getString("remarks"));
				list.add(spot);
			}
		} catch (SQLException e)
		{
			throw new DbException(e);
		}
		return list;
	}
	
	public void addUserToSpot(String spotID, User user)
	{
		if (spotID.isEmpty() || user == null)
		{
			throw new DbException("Niets te vinden !");
		}
		String sql = "UPDATE jobfair_group4.spots SET userID = ? WHERE spotID = ?";
		
		try
		{
			statement = connection.prepareStatement(sql);
			statement.setString(1, user.getContactName());
			statement.setString(2, spotID);
			statement.execute();
		} catch (SQLException e)
		{
			throw new DbException(e.getMessage(), e);
		}
	}
	
	public void removeUserFromSpot(String spotID)
	{
		if (spotID.isEmpty())
		{
			throw new DbException("Niets te vinden !");
		}
		String sql = "UPDATE jobfair_group4.spots SET userID = NULL WHERE spotID = ?";
		
		try
		{
			statement = connection.prepareStatement(sql);
			statement.setString(1, spotID);
			statement.execute();
		} catch (SQLException e)
		{
			throw new DbException(e.getMessage(), e);
		}
	}
	
	public Properties getProperties()
	{
		return properties;
	}
	
	public void setProperties(Properties properties)
	{
		this.properties = properties;
	}
	
	
	

	
	
	
}