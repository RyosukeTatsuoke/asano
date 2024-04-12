package kannri;

import tool.Page;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(urlPatterns= {"/kannri/ALL"})
public class ALL extends HttpServlet{
	public void doget(
		HttpServletRequest request,HttpServletResponse response
		)throws ServletException,IOException{
		PrintWriter out=response.getWriter();
		Page.header(out);
		try{
			InitialContext ic=new InitialContext();
			DataSource ds=(DataSource)ic.lookup(
					"java:/comp/env/jdbc/score1");
			Connection con=ds.getConnection();
			
		PreparedStatement st=con.prepareStatement(
				"select * from SUBJECT");
		ResultSet re=st.executeQuery();
		
		while (rs.next()) {
			out.println(rs.getChar("SCHOOL_CD"));
			out.println(":");
			out.println(rs.getChar("CD"));
			out.println(":");
			out.println(rs.getVarchar("NAME"));
			out.println("<br>");
		}
		
		st.close();
		con.close();
	  }catch (Exception e) {
		  e.printStackTrace(out);
	  }
	  Page.footer(out);
	}
	
}