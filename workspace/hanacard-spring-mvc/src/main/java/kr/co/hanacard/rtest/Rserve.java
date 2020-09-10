package kr.co.hanacard.rtest;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Rserve {

	public static void main(String[] args) {

		RConnection connection = null;

		try {
			/*
			 * Create a connection to Rserve instance running IP Addr, UserID, Password
			 * required (/etc/Ruser.txt)
			 */
			connection = new RConnection("34.64.132.162", 6311);
			connection.login("rserv", "rserv"); // R 계정 추가해놨음. /etc/Ruser.txt
			String vector = "c(1,2,3,4)";
			connection.eval("meanVal=mean(" + vector + ")");
			double mean = connection.eval("meanVal").asDouble();
			System.out.println("The mean of given vector is=" + mean);

			REXP x = connection.eval("R.version.string");
			System.out.println(x.asString());
			double[] myvalues = { 1.0, 1.5, 2.2, 0.5, 0.9, 1.12 };
			connection.assign("myvalues", myvalues);
			x = connection.eval("mean(myvalues)");
			System.out.println(x.asDouble());
			x = connection.eval("sd(myvalues)");
			System.out.println(x.asDouble());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}

	}

}
