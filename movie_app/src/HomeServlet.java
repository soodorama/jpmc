

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// test of attributes
		ArrayList<String> test = new ArrayList<String>();
		test.add("This is a test string.");
		test.add("This is a second test string.");
		request.setAttribute("test", test);
		
		// access the database
		String tsv = "movietitle\tminutes\n";
		ArrayList<String> list = new ArrayList<String>();
		Connection c = null;
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
		    Class.forName(driverName);
			String url = "jdbc:oracle:thin:@forktail.dsc.umich.edu:1521:COURSEDB";
			c = DriverManager.getConnection(url,"sravan","jpmc");
			String query = "select movietitle, minutes from movies";
			Statement stmt = c.createStatement();
			ResultSet rst = stmt.executeQuery(query);
			while(rst.next())
			{
				tsv += rst.getString(1) + '\t' + rst.getInt(2) + '\n';
				list.add(rst.getString(1) + ": " + rst.getInt(2) + " mins");
			}
			c.close();
		} catch (SQLException e) {
			tsv = "failed1";
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			tsv = "failed2";
			e.printStackTrace();
		}
		request.setAttribute("tsv", tsv);
		request.setAttribute("list", list);
		
		// Go to JSP file
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
