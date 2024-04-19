package tool;

import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns= {"/tool/Page"})

public class Page {
	public static void header(PrintWriter out) {
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<headl>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Servlet/jsp Sample Programs</title>");
		out.println("</head>");
		out.println("<body>");
	}
	
	public static void footer(PrintWriter out) {
		out.println("</body>");
		out.println("</html>");
	}
}