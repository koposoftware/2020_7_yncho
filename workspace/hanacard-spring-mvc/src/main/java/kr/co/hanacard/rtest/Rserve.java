package kr.co.hanacard.rtest;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

public class Rserve {

	public static void main(String[] args) {

		RConnection c = null;

		try {
			
			
			c = new RConnection("34.64.132.162", 6311);
			c.login("rserv", "rserv");
			c.eval("library(recocard)");

			
			c.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			c.eval("result2 <- getTopDisList(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			c.eval("result3 <- getTopMileList(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			c.eval("result4 <- getTopPointList(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			c.eval("result5 <- getTopTotalList(1,2,3,4,5,6,7,8,9,10,11,12,13)");

			//c.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			//c.eval("df <- doReadCSV('"+ dataPath + upFileNm+ "')");
			
			RList table = c.eval("result").asList();
			RList table2 = c.eval("result2").asList();
			RList table3 = c.eval("result3").asList();
			RList table4 = c.eval("result4").asList();
			RList table5 = c.eval("result5").asList();
			
			
			int cols = table.size();
			int rows = table.at(0).length();

			String[][] s = new String[cols][];

			for (int i = 0; i < cols; i++) {
				s[i] = table.at(i).asStrings();
			}

			for (int i = 0; i < cols; i++) {
				for (int j = 0; j < rows; j++) {
					System.out.println(s[i][j]);
				}
			}
			
			
			System.out.println("===================table2==================");
			int cols2 = table2.size();
			int rows2 = table2.at(0).length();
			
			String[][] s2 = new String[cols2][];
			
			for (int i = 0; i < cols2; i++) {
				s2[i] = table2.at(i).asStrings();
			}
			
			for (int i = 0; i < cols2; i++) {
				for (int j = 0; j < rows2; j++) {
					System.out.println(s2[i][j]);
				}
			}
			
			System.out.println("=======================");
			
			
			
			
			
			
			
			
			
			
			
			
			
			//System.out.println("total num : " + s[0][0]);
			//System.out.println("best card : " + s[1][0]);
			
			
			
			
			
			
//			System.out.println("hello");
//			System.out.println(table);
//			System.out.println(table.get(0));
//			System.out.println(table.names);
//			System.out.println(table.names.toString());
//			
//			System.out.println(table.toString());
//			System.out.println(table.at(0));
//			System.out.println(table.elementAt(0).toString());
			
			
			
			/*
			 * Create a connection to Rserve instance running IP Addr, UserID, Password
			 * required (/etc/Ruser.txt)
			 */
			
			
//			c = new RConnection("34.64.132.162", 6311);
//			c.login("rserv", "rserv"); // R 계정 추가해놨음. /etc/Ruser.txt
//			
//			c.eval("library(recocard)");
//			
//			
//			
//			int type1 = 10;
//			int type2 = 10;
//			int type3 = 10;
//			int type4 = 10;
//			int type5 = 10;
//			int type6 = 10;
//			int type7 = 10;
//			int type8 = 10;
//			int type9 = 10;
//			int type10 = 10;
//			int type11 = 10;
//			int type12 = 10;
//			int type13 = 10;
//			String connPath = "jdbc:oracle:thin:@//34.64.132.162:1521/xe";
//			String id = "system";
//			String pw = "920415";
//			
//			//String input = "1,2,3,4,5,6,7,8,9,10,11,12,13, 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', , 'system', '920415'";
//			//String input = "1,2,3,4,5,6,7,8,9,10,11,12,13";
//			//c.eval("getBestOneCard(" + input + ")");
//			c.eval("getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			
			//result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13, 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', 'system', '920415')

			//RList tmp = c.eval("getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13, 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', 'system', '92015' )").asList();
			
//			REXP tmp = c.eval("getBestOneCard(" + type1 + "," + type2 + "," + type3 + "," + type4 + "," + type5 + "," 
//					+ type6 + "," + type7 + "," + type8 + "," + type9 + "," + type10 + "," +  type11 + "," 
//					+ type12 + "," + type13 + ", 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', 'system', '920415' )");
			
//			REXP tmp = c.eval("getBestOneCard(" + type1 + "," + type2 + "," + type3 + "," + type4 + "," + type5 + "," 
//					+ type6 + "," + type7 + "," + type8 + "," + type9 + "," + type10 + "," +  type11 + "," 
//					+ type12 + "," + type13 + "," + connPath + "," + id + "," +  pw + ")");
		
			//REXP tmp = c.eval("getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13, 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', 'system', '920415')");
			//REXP tmp = c.parseAndEval("getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13, 'jdbc:oracle:thin:@//34.64.132.162:1521/xe', 'system', '920415')");
			
			
			
			//conn <- dbConnect(jdbc_driver, "jdbc:oracle:thin:@//34.64.132.162:1521/xe", "system", "920415")
			
			
			
			
			/*
			String vector = "c(1,2,3,4)";
			c.eval("meanVal=mean(" + vector + ")");
			double mean = c.eval("meanVal").asDouble();
			System.out.println("The mean of given vector is=" + mean);

			REXP x = c.eval("R.version.string");
			System.out.println(x.asString());
			double[] myvalues = { 1.0, 1.5, 2.2, 0.5, 0.9, 1.12, 1000 };
			c.assign("myvalues", myvalues);
			x = c.eval("mean(myvalues)");
			System.out.println(x.asDouble());
			x = c.eval("sd(myvalues)");
			System.out.println(x.asDouble());
			*/
			
			/*
			connection = new RConnection("34.64.132.162", 6311);
			connection.login("rserv", "rserv"); // R 계정 추가해놨음. /etc/Ruser.txt
			String vector = "c(1,2,3,4)";
			connection.eval("meanVal=mean(" + vector + ")");
			double mean = connection.eval("meanVal").asDouble();
			System.out.println("The mean of given vector is=" + mean);

			REXP x = connection.eval("R.version.string");
			System.out.println(x.asString());
			double[] myvalues = { 1.0, 1.5, 2.2, 0.5, 0.9, 1.12, 1000 };
			connection.assign("myvalues", myvalues);
			x = connection.eval("mean(myvalues)");
			System.out.println(x.asDouble());
			x = connection.eval("sd(myvalues)");
			System.out.println(x.asDouble());
			*/
			


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			c.close();
		}

	}

}
