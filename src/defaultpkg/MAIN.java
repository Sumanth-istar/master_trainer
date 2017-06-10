package defaultpkg;

import com.istarindia.apps.dao.IstarUser;
import com.istarindia.apps.dao.IstarUserDAO;

public class MAIN {
	
	
	public static void main(String[] args) {
		
		
		
		IstarUserDAO dao = new IstarUserDAO();
		IstarUser user = (IstarUser) dao.findByUserType("ISTAR_COORDINATOR");
		
		System.out.println(user.getEmail());
		
	}

}
