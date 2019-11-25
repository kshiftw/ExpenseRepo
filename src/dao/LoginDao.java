package dao;

import model.Login;

public interface LoginDao {
	public boolean validate (Login login) throws ClassNotFoundException;
}
